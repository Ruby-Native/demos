# Bookmarks (Turbo demo)

A bookmark manager built with Rails and Hotwire. Demonstrates Ruby Native with a Turbo frontend, Bootstrap styling, and push notifications.

## Features

- Save and tag bookmarks
- Native tab bar (Links, Tags, Demo)
- Back button navigation
- Form handling (skips forms when navigating back)
- Push notifications
- Dark mode

## Quick start

```bash
bin/setup
```

This installs dependencies, seeds the database, and starts the server on port 3001.

Default login: `user@example.com` / `password`

## Requirements

- Ruby (no pinned version)
- SQLite (`brew install sqlite`)

## Ruby Native config

```yaml
app:
  name: Bookmarks

tabs:
  - title: Links
    path: /links
    icon: link
  - title: Tags
    path: /tags
    icon: tag
  - title: Demo
    path: /demo
    icon: flask
```

See `config/ruby_native.yml` for the full config including dark mode colors.
