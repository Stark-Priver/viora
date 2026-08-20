# Contributing to Viora

Thanks for your interest in improving Viora — a personal life operating
system built in Flutter. Contributions of all sizes are welcome, from typo
fixes to new modules.

## Getting started

```bash
git clone git@github.com:Stark-Priver/viora.git
cd viora
flutter pub get
flutter run -d chrome   # or -d linux / a connected device
```

If you change anything in `lib/core/database/tables.dart` or a `*_dao.dart`
file, regenerate the Drift code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Before opening a PR

```bash
flutter analyze
flutter test --concurrency=1
```

`--concurrency=1` matters — running the FFI-backed `database_test.dart`
alongside `widget_test.dart` at default concurrency silently drops most of
the database tests in this environment.

## Code style

- Follow the existing feature-first structure: `lib/features/<feature>/domain`
  and `lib/features/<feature>/presentation/{providers,widgets}`.
- Never hardcode a `Color` or raw `EdgeInsets` in a screen — every color,
  spacing value, radius, shadow, and animation timing is a token in
  `lib/core/design_system/`. Reuse it.
- Keep PRs focused. One feature or fix per PR is easier to review than a
  bundle of unrelated changes.
- Add or update tests for behavior you change.

## Reporting bugs / requesting features

Open a GitHub issue with steps to reproduce (for bugs) or the problem you're
trying to solve (for feature requests). Screenshots and screen recordings
help a lot for UI issues.

## Questions

Open a [discussion](https://github.com/Stark-Priver/viora/discussions) or an
issue — happy to help.
