<div align="center">

# viora

**A personal life operating system, built in Flutter.**

Plan life → live life → capture reality → understand behavior → review → adjust → improve.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Platforms](https://img.shields.io/badge/platform-Android%20%7C%20Linux%20%7C%20Web-informational)](#running)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

[Follow on GitHub](https://github.com/Stark-Priver) · [YouTube](https://www.youtube.com/@de_priver)

</div>

---

## What is Viora?

Viora is a single app for the parts of life that are usually scattered
across a dozen different apps: tasks, goals, projects, habits, focus
sessions, money, calendar, journal, career, business, education, transport,
health, and more — all local-first, all in one restrained, neumorphic UI.

## Status

Phase 1 Core is built and running end to end on a real local database —
nothing on the Home dashboard is sample data anymore.

- **Design system** — restrained neumorphism, light/dark themes, a full
  token set (color, spacing, typography, motion), and an "abstract shapes"
  accent layer (soft radial-gradient orbs) used on hero/summary cards.
- **Home dashboard** — greeting header, quick actions, today's progress,
  live focus timer, money snapshot, life breakdown, today's tasks, habits,
  and goals — all reading from the same database every other screen writes
  to.
- **Tasks** — CRUD, priority, deadline, status filters (Active/Completed/All).
- **Goals** — targets, progress logging (with running-total transaction),
  grouped cards.
- **Projects** — CRUD, status cycling, budget field, status-breakdown summary.
- **Habits** — binary/quantitative habits with a 7-day completion strip and
  a live "done today" summary.
- **Focus** — start/pause/stop sessions with a live ring timer, persisted
  history.
- **Money** — accounts (auto-provisioned "Cash"), income/expense
  transactions, monthly income/spend/net summary.
- **Calendar** — month/week/day views, recurrence rules, reminders.
- **Journal** — daily win/problem/lesson/gratitude/priority entries,
  per-day navigation.
- **Career** — position history and achievement log.
- **Business** — clients, projects, revenue/expense/effective-rate tracking.
- **Education** — study session logging with weekly/all-time stats.
- **Transport** — vehicle fuel and maintenance logging with cost summaries.
- **Health** — health tracking module.
- **Analytics / Reports** — cross-feature weekly rollups (focus time, task
  completion, spend, habit consistency, goal velocity) computed live from
  the database.
- **Timeline** — a unified activity log across every module.
- **Settings** — theme (system/light/dark), persisted.
- **Notifications & feedback** — local reminders for calendar events, an
  audio + animation cue on task completion, and an Android home-screen
  widget.

Modules not yet built (AI Coach, Communications, and a couple of others)
still appear in the nav, grouped correctly, but are marked "coming soon" —
see `lib/core/design_system/shell/viora_nav.dart` for the full module map.

## Visual language

Restrained neumorphism: soft dual-shadow raised surfaces, recessed
(inset-shadow) controls for tracks and selected states, warm off-white
light theme / deep-charcoal dark theme, a single coral-red brand accent,
Manrope type, lowercase `viora` wordmark in Fraunces italic. See
`lib/core/design_system/` — every color, spacing value, radius, shadow, and
animation timing used anywhere in the app is a token defined there; screens
should never hardcode a `Color` or raw `EdgeInsets`.

## Running

```bash
flutter pub get
flutter run -d chrome   # or -d linux / a connected Android device
```

Database code is generated — after changing anything in
`lib/core/database/tables.dart` or a `*_dao.dart` file, regenerate with:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Web build note

Running on web needs `web/sqlite3.wasm` and `web/drift_worker.dart.js`
(already checked in). If you ever need to regenerate the worker after a
`drift` version bump:

```bash
cp $(dart pub cache dir 2>/dev/null || echo ~/.pub-cache)/hosted/pub.dev/drift-*/web/drift_worker.dart tool/drift_worker.dart
dart compile js -O4 -o web/drift_worker.dart.js tool/drift_worker.dart
```

and fetch a matching `sqlite3.wasm` from the
[sqlite3.dart releases](https://github.com/simolus3/sqlite3.dart/releases)
page for whatever version of the `sqlite3` package is in `pubspec.lock`.

## Testing

```bash
flutter analyze
flutter test --concurrency=1
```

`--concurrency=1` matters here: running the FFI-backed `database_test.dart`
alongside `widget_test.dart` at default concurrency silently drops most of
the database tests in this environment (isolate interaction, not an app bug).

## Structure

```
lib/
  core/
    design_system/
      tokens/       # colors, spacing/radii, typography, motion, breakpoints
      theme/         # ThemeData builder + ThemeMode persistence
      widgets/       # VioraSurface, VioraCard, VioraButton, VioraStat, ...
      shell/         # responsive app shell (sidebar / rail / bottom nav)
    database/
      tables.dart    # Drift table definitions
      app_database.dart
      daos/          # one DAO per feature area
    routing/         # go_router config, wires nav paths to screens
    services/        # notifications, audio feedback, home-screen widget
  features/
    home/            # dashboard
    tasks/ goals/ projects/ habits/ focus/ money/ calendar/ journal/
    career/ business/ education/ transport/ health/
    analytics/ reports/ timeline/ settings/ more/
      domain/        # (where applicable) plain data models
      presentation/
        providers/   # Riverpod providers over the DAOs
        widgets/     # feature-specific UI
```

## Roadmap

- **Bring your own sync** — an in-app, no-setup-required option to keep
  data fully local (default) or link a Google Drive / Supabase account for
  cross-device sync, aimed at non-developers.
- Auth/onboarding flow.
- Android/Windows/Linux telemetry agents.
- Remaining life modules: AI Coach, Communications, Relationships, Location.

## Contributing

Contributions are welcome — see [CONTRIBUTING.md](CONTRIBUTING.md) for the
dev setup, code style, and PR checklist.

## License

MIT — see [LICENSE](LICENSE).

## Support

If Viora is useful to you, consider supporting its development, following
along, or subscribing for build videos:

- ⭐ Star this repo
- 🐙 [github.com/Stark-Priver](https://github.com/Stark-Priver)
- ▶️ [YouTube — @de_priver](https://www.youtube.com/@de_priver)
