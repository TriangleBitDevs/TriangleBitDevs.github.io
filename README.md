# Triangle BitDevs

Static site for Triangle BitDevs meetups, built with [Zola](https://www.getzola.org/).

## Prerequisites

- [Rust + Cargo](https://www.rust-lang.org/tools/install)
- [`just`](https://github.com/casey/just) task runner

Install `just` with Cargo if needed:

```bash
cargo install just
```

## Local development

From the repo root:

```bash
just install
just serve
```

- `just install` installs Zola from source:
  `cargo install --locked --git https://github.com/getzola/zola --tag v$(cat .zola-version)`
- `just serve` runs `zola serve --open --drafts`

The dev server runs at `http://localhost:1111`.

## Build

```bash
just build
```

This runs:
- `just build-calendar-ics` (generates `static/calendar.ics`)
- `zola build`

## Content workflow

Event/content pages live in `content/*.md` and use TOML front matter (`+++`).

Example front matter:

```toml
+++
title = "Socratic Seminar 50"
date = 2026-03-11
template = "page.html"

[extra]
event_type = "socratic"
add_to_calendar = true
start = "2026-03-11T22:00:00Z"
end = "2026-03-12T00:00:00Z"
location = "APEX 1, Fidelity Investments, 100 New Millennium Way, Durham, NC 27709"
+++
```

Notes:
- `start`/`end` are stored in UTC (`Z`) in content.
- Event display and ICS output are rendered in `America/New_York` (EST/EDT as appropriate).

## Calendar helper tool

There is a small helper binary for generating event front matter:

```bash
just build-calendar-gen
just new-event
```

## Other useful commands

- `just build-calendar-ics` regenerates the top-level site calendar feed at `/calendar.ics`.
- `just check-links` checks legacy Jekyll URL aliases.
- `just edit` opens the most recent event file.
- `just update-feed-template` refreshes `templates/feed.xml` from Zola builtins.

## Zola version pinning

The Zola version is pinned in `.zola-version`.
- Local install (`just install`) uses this pinned version.
- GitHub Actions deploy uses the same pinned version.

To upgrade Zola:
1. Update `.zola-version`.
2. Run `just install`.
3. Run `just build` and verify output.
