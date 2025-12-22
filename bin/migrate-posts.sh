#!/usr/bin/env bash
set -euo pipefail

# Migration script to convert Jekyll posts to Zola format
# Usage: ./bin/migrate-posts.sh

JEKYLL_POSTS_DIR="_posts"
ZOLA_EVENTS_DIR="content/events"

# Create events directory if it doesn't exist
mkdir -p "$ZOLA_EVENTS_DIR"

# Process each Jekyll post
for jekyll_file in "$JEKYLL_POSTS_DIR"/*.md; do
    # Extract filename without path
    filename=$(basename "$jekyll_file")

    # Extract date and slug from filename (YYYY-MM-DD-slug.md)
    if [[ $filename =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2})-(.+)\.md$ ]]; then
        year="${BASH_REMATCH[1]}"
        month="${BASH_REMATCH[2]}"
        day="${BASH_REMATCH[3]}"
        slug="${BASH_REMATCH[4]}"
        date="$year-$month-$day"

        # Create new filename (just the slug)
        new_filename="$slug.md"
        zola_file="$ZOLA_EVENTS_DIR/$new_filename"

        echo "Migrating: $filename -> $new_filename"

        # Read the Jekyll file
        content=$(cat "$jekyll_file")

        # Extract frontmatter and body
        # Using awk to split at the second ---
        frontmatter=$(echo "$content" | awk '/^---$/{i++; next} i==1')
        body=$(echo "$content" | awk '/^---$/{i++; if(i>1) flag=1; next} flag')

        # Parse frontmatter fields (preserve quotes)
        title=$(echo "$frontmatter" | grep '^title:' | sed 's/^title: *//')
        type=$(echo "$frontmatter" | grep '^type:' | sed 's/^type: *//' || echo "socratic")
        layout=$(echo "$frontmatter" | grep '^layout:' | sed 's/^layout: *//' || echo "post")
        meetup=$(echo "$frontmatter" | grep '^meetup:' | sed 's/^meetup: *//' || echo "")
        nostr=$(echo "$frontmatter" | grep '^nostr:' | sed 's/^nostr: *//' || echo "")
        add_to_calendar=$(echo "$frontmatter" | grep '^add_to_calendar:' | sed 's/^add_to_calendar: *//' || echo "")
        start=$(echo "$frontmatter" | grep '^start:' | sed 's/^start: *//' || echo "")
        end=$(echo "$frontmatter" | grep '^end:' | sed 's/^end: *//' || echo "")
        location=$(echo "$frontmatter" | grep '^location:' | sed 's/^location: *//' || echo "")
        description=$(echo "$frontmatter" | grep '^description:' | sed 's/^description: *//' || echo "")

        # Generate old Jekyll URLs for aliases
        jekyll_url="$year-$month-$day-$slug"
        jekyll_url_slash="/$year-$month-$day-$slug/"
        jekyll_url_dated="/$year/$month/$day/$slug"

        # Build Zola frontmatter
        zola_frontmatter="+++
title = $title
date = $date
template = \"page.html\"
aliases = [
  \"$jekyll_url\",
  \"$jekyll_url_slash\",
  \"$jekyll_url_dated\"
]

[extra]
event_type = \"$type\""

        # Add optional extra fields
        if [ -n "$meetup" ]; then
            # Remove existing quotes if present
            meetup=$(echo "$meetup" | sed 's/^"//' | sed 's/"$//')
            zola_frontmatter="$zola_frontmatter
meetup = \"$meetup\""
        fi

        if [ -n "$nostr" ]; then
            # Remove existing quotes if present
            nostr=$(echo "$nostr" | sed 's/^"//' | sed 's/"$//')
            zola_frontmatter="$zola_frontmatter
nostr = \"$nostr\""
        fi

        if [ -n "$add_to_calendar" ] && [ "$add_to_calendar" = "true" ]; then
            zola_frontmatter="$zola_frontmatter
add_to_calendar = true"

            if [ -n "$start" ]; then
                start=$(echo "$start" | sed 's/^"//' | sed 's/"$//')
                zola_frontmatter="$zola_frontmatter
start = \"$start\""
            fi

            if [ -n "$end" ]; then
                end=$(echo "$end" | sed 's/^"//' | sed 's/"$//')
                zola_frontmatter="$zola_frontmatter
end = \"$end\""
            fi

            if [ -n "$location" ]; then
                zola_frontmatter="$zola_frontmatter
location = $location"
            fi

            if [ -n "$description" ]; then
                zola_frontmatter="$zola_frontmatter
description = $description"
            fi
        fi

        zola_frontmatter="$zola_frontmatter
+++"

        # Write the new Zola file
        echo "$zola_frontmatter" > "$zola_file"
        echo "" >> "$zola_file"
        echo "$body" >> "$zola_file"

    else
        echo "Skipping $filename (doesn't match expected format)"
    fi
done

echo ""
echo "Migration complete!"
echo "Migrated posts are in $ZOLA_EVENTS_DIR/"
