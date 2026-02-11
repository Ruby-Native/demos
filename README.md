# Demo apps

Two Rails apps demonstrating the `ruby_native` gem with different frontend frameworks.

## Turbo demo (`turbo/`)

A bookmarks/links app using Turbo Drive + importmap.

- **Stack:** Rails 8.1.2, Turbo, Stimulus, Bootstrap CSS
- **Port:** 3000
- **Start:** `bin/dev`
- **Login:** `user@example.com` / `password`

## React demo (`react/`)

A habit tracker app using Inertia.js + React 19.

- **Stack:** Rails 8.1.2, Inertia Rails, React 19, Vite, Tailwind CSS 4
- **Port:** 3001 (Vite on 3136)
- **Start:** `bin/dev` (uses overmind)
- **Login:** `user@example.com` / `password`

## Setup

Both apps reference the gem at `../../gem`. From either demo directory:

```bash
bundle install
bin/rails db:setup
bin/dev
```

The React demo also needs `npm install` before first run.
