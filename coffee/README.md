# Daily Grind (coffee demo)

A coffee shop ordering app built with Rails, Hotwire, and Tailwind CSS. Demonstrates Ruby Native with a polished consumer-facing UI, rewards system, and guest checkout.

## Features

- Browse menu by category
- Add items to cart with extras (e.g., vanilla syrup, oat milk)
- Order tracking
- Rewards points and activity history
- Guest browsing with sign-in for ordering
- Native tab bar (Menu, Orders, Rewards, Account)
- Back button navigation
- Form handling
- Push notifications
- Dark mode

## Quick start

```bash
bin/setup
bin/dev
```

Runs on port 3003. The dev server starts Rails and the Tailwind CSS watcher.

Default login: `demo@example.com` / `password`

## Requirements

- Ruby 4.0.1
- SQLite (`brew install sqlite`)

## Ruby Native config

```yaml
app:
  name: Daily Grind

tabs:
  - title: Menu
    path: /menu
    icon: cup.and.saucer
  - title: Orders
    path: /orders
    icon: bag
  - title: Rewards
    path: /rewards
    icon: star
  - title: Account
    path: /account
    icon: person
```

See `config/ruby_native.yml` for the full config including dark mode colors.
