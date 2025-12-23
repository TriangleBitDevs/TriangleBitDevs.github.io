list:
  just --list

install:
  cargo install zola

# Build the calendar-gen tool
build-calendar-gen:
  cd bin/calendar-gen && cargo build --release
  cp bin/calendar-gen/target/release/calendar-gen bin/calendar-gen-bin

# Create new event with timezone-aware calendar data
new-event:
  ./bin/calendar-gen-bin

# Build and serve locally with drafts
serve:
  zola serve --open --drafts

# Open browser to local site
open:
  open http://localhost:1111

# Build for production
build:
  zola build

# Check that old Jekyll URLs still work
check-links:
  ./bin/check-links

# Edit the most recent event
edit:
  vim content/`ls -t content/*.md | head -n1 | xargs basename`

# Update feed template from Zola builtins
update-feed-template:
  curl \
    https://raw.githubusercontent.com/getzola/zola/master/components/templates/src/builtins/atom.xml \
    > templates/feed.xml
