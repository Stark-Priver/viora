# Setting up cloud sync

Viora is local-first: every install works fully offline with zero setup.
Sync is opt-in and lets a user back up and restore their database to their
own Google Drive or a Supabase account, entirely from Settings → **Data &
Sync** — no developer tools required on their end.

To make either backend selectable in a build, the **app maintainer** (not
each end user) provisions one shared project and passes its public
identifiers in at build time via `--dart-define`. Nothing secret goes in
the repo.

## Supabase (recommended — works on every platform)

1. Create a project at [supabase.com](https://supabase.com).
2. In **Storage**, create a new **private** bucket named `viora-backups`.
3. Add a storage policy so a user can only read/write their own folder
   (replace `viora-backups` if you named it differently):

   ```sql
   create policy "Users manage their own backup"
   on storage.objects for all
   using (bucket_id = 'viora-backups' and (storage.foldername(name))[1] = auth.uid()::text)
   with check (bucket_id = 'viora-backups' and (storage.foldername(name))[1] = auth.uid()::text);
   ```

4. In **Project Settings → API**, copy the **Project URL** and the
   **anon / publishable key** (safe to ship in a client — it's public by
   design; the storage policy above is what actually protects the data).
5. Run the app with:

   ```bash
   flutter run \
     --dart-define=SUPABASE_URL=https://xxxx.supabase.co \
     --dart-define=SUPABASE_ANON_KEY=eyJ...
   ```

Email/password auth works out of the box — no extra Supabase configuration
needed beyond the bucket and policy above.

## Google Drive (Android + Web only)

The `google_sign_in` plugin doesn't support Linux desktop, so this backend
is gated to Android and Web — see `SyncConfig.isGoogleDrivePlatformSupported`.

1. Create a project in the [Google Cloud Console](https://console.cloud.google.com/).
2. Enable the **Google Drive API**.
3. Configure the OAuth consent screen (External, minimal scopes).
4. Create OAuth client IDs:
   - **Android**: package name `com.viora.viora` (see `android/app/build.gradle.kts`)
     + your release/debug keystore's SHA-1 fingerprint. No client ID needs
     to be passed in code for Android — it's resolved automatically from
     this registration.
   - **Web**: an OAuth client ID with your deployed origin as an
     authorized JavaScript origin.
5. Run the app with the web client ID (Android needs nothing extra):

   ```bash
   flutter run --dart-define=GOOGLE_WEB_CLIENT_ID=xxxx.apps.googleusercontent.com
   ```

Backups are stored in the signed-in user's Drive **app data folder** — a
hidden, per-app space Drive grants with the `drive.appdata` scope, so it
never shows up in or clutters their visible Drive files.

## How restore works

Replacing the live SQLite file while the app (and its database connection)
is running is unsafe. Restoring a backup downloads it and stages it as
`viora.sqlite.pending-restore`; the swap into place happens the *next* time
the app starts, before the database opens (see `LocalBackup` in
`lib/core/sync/local_backup.dart`). The UI tells the user to restart the
app after a restore for this reason.

## Running with no config at all

If you don't pass any `--dart-define` values, the app runs exactly as
before: fully local, with Google Drive and Supabase shown in Settings as
"not configured yet" rather than broken buttons.
