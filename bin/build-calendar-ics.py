#!/usr/bin/env python3
"""Build a site-wide ICS file from event front matter."""

from __future__ import annotations

from dataclasses import dataclass
from datetime import UTC, datetime
from pathlib import Path
from zoneinfo import ZoneInfo
import tomllib


ROOT = Path(__file__).resolve().parent.parent
CONTENT_DIR = ROOT / "content"
CONFIG_PATH = ROOT / "config.toml"
OUTPUT_PATH = ROOT / "static" / "calendar.ics"
CAL_TZ = "America/New_York"


VTIMEZONE_BLOCK = [
    "BEGIN:VTIMEZONE",
    "TZID:America/New_York",
    "X-LIC-LOCATION:America/New_York",
    "BEGIN:DAYLIGHT",
    "TZOFFSETFROM:-0500",
    "TZOFFSETTO:-0400",
    "TZNAME:EDT",
    "DTSTART:19700308T020000",
    "RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=2SU",
    "END:DAYLIGHT",
    "BEGIN:STANDARD",
    "TZOFFSETFROM:-0400",
    "TZOFFSETTO:-0500",
    "TZNAME:EST",
    "DTSTART:19701101T020000",
    "RRULE:FREQ=YEARLY;BYMONTH=11;BYDAY=1SU",
    "END:STANDARD",
    "END:VTIMEZONE",
]


@dataclass(frozen=True)
class Event:
    slug: str
    title: str
    start_utc: datetime
    end_utc: datetime
    location: str
    description: str
    url: str


def parse_front_matter(page_path: Path) -> dict:
    text = page_path.read_text(encoding="utf-8")
    if not text.startswith("+++"):
        return {}

    end = text.find("\n+++", 3)
    if end == -1:
        return {}

    toml_blob = text[3 : end + 1].strip()
    if not toml_blob:
        return {}

    return tomllib.loads(toml_blob)


def parse_utc(timestamp: str) -> datetime:
    # Content stores UTC timestamps with trailing Z.
    return datetime.fromisoformat(timestamp.replace("Z", "+00:00")).astimezone(UTC)


def ical_escape(value: str) -> str:
    return (
        value.replace("\\", "\\\\")
        .replace("\n", "\\n")
        .replace(",", "\\,")
        .replace(";", "\\;")
    )


def fold_ical_line(line: str, max_octets: int = 73) -> list[str]:
    # RFC 5545 line folding: continuation lines start with one space.
    parts: list[str] = []
    current = ""
    current_octets = 0

    for char in line:
        octets = len(char.encode("utf-8"))
        if current and current_octets + octets > max_octets:
            parts.append(current)
            current = " " + char
            current_octets = 1 + octets
        else:
            current += char
            current_octets += octets

    if current:
        parts.append(current)
    return parts


def load_base_url() -> str:
    cfg = tomllib.loads(CONFIG_PATH.read_text(encoding="utf-8"))
    return cfg.get("base_url", "https://trianglebitdevs.org").rstrip("/")


def collect_events() -> list[Event]:
    base_url = load_base_url()
    out: list[Event] = []

    for page in sorted(CONTENT_DIR.glob("*.md")):
        fm = parse_front_matter(page)
        extra = fm.get("extra")
        if not isinstance(extra, dict) or not extra.get("add_to_calendar"):
            continue

        start = extra.get("start")
        end = extra.get("end")
        if not isinstance(start, str) or not isinstance(end, str):
            continue

        title = fm.get("title", page.stem)
        if not isinstance(title, str):
            title = page.stem

        location = extra.get("location", "")
        description = extra.get("description", "")
        if not isinstance(location, str):
            location = ""
        if not isinstance(description, str):
            description = ""

        slug = page.stem
        out.append(
            Event(
                slug=slug,
                title=title,
                start_utc=parse_utc(start),
                end_utc=parse_utc(end),
                location=location,
                description=description,
                url=f"{base_url}/{slug}/",
            )
        )

    out.sort(key=lambda ev: (ev.start_utc, ev.slug))
    return out


def build_ics(events: list[Event]) -> str:
    tz = ZoneInfo(CAL_TZ)
    lines = [
        "BEGIN:VCALENDAR",
        "VERSION:2.0",
        "PRODID:-//Triangle BitDevs//Calendar//EN",
        "CALSCALE:GREGORIAN",
        "X-WR-CALNAME:Triangle BitDevs Events",
        f"X-WR-TIMEZONE:{CAL_TZ}",
        *VTIMEZONE_BLOCK,
    ]

    for event in events:
        start_local = event.start_utc.astimezone(tz).strftime("%Y%m%dT%H%M%S")
        end_local = event.end_utc.astimezone(tz).strftime("%Y%m%dT%H%M%S")
        stamp = event.start_utc.strftime("%Y%m%dT%H%M%SZ")
        uid = f"{event.slug}-{stamp.lower()}@trianglebitdevs.org"

        event_lines = [
            "BEGIN:VEVENT",
            f"UID:{uid}",
            f"DTSTAMP:{stamp}",
            f"DTSTART;TZID={CAL_TZ}:{start_local}",
            f"DTEND;TZID={CAL_TZ}:{end_local}",
            f"SUMMARY:{ical_escape(event.title)}",
            f"LOCATION:{ical_escape(event.location)}",
            f"DESCRIPTION:{ical_escape(event.description)}",
            f"URL:{ical_escape(event.url)}",
            "END:VEVENT",
        ]
        for line in event_lines:
            lines.extend(fold_ical_line(line))

    lines.append("END:VCALENDAR")
    return "\r\n".join(lines) + "\r\n"


def main() -> None:
    events = collect_events()
    ics = build_ics(events)
    OUTPUT_PATH.write_text(ics, encoding="utf-8")
    print(f"Wrote {OUTPUT_PATH} ({len(events)} events)")


if __name__ == "__main__":
    main()
