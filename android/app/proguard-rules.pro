# Play Core split-install classes are referenced by Flutter's deferred
# components support even though this app doesn't use deferred components.
-dontwarn com.google.android.play.core.**

# Google Sign-In / Play Services (Google Drive sync backend).
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# sqlite3_flutter_libs / drift native bindings.
-keep class io.requery.android.database.sqlite.** { *; }
-dontwarn io.requery.android.database.sqlite.**

# flutter_local_notifications.
-keep class com.dexterous.** { *; }

# home_widget (Android home-screen widget bridge).
-keep class es.antonborri.home_widget.** { *; }

# AndroidX WorkManager (pulled in transitively by flutter_local_notifications
# for scheduled reminders) uses Room internally, which generates DAO/database
# implementation classes (e.g. WorkDatabase_Impl) that R8 was stripping —
# crashed on every launch with "Failed to create an instance of
# androidx.work.impl.WorkDatabase" before this rule was added.
-keep class androidx.work.** { *; }
-dontwarn androidx.work.**
-keep class androidx.room.** { *; }
-keep class * extends androidx.room.RoomDatabase { *; }
-keep @androidx.room.Entity class * { *; }
-dontwarn androidx.room.**

# Reflection metadata some plugins rely on for JSON (de)serialization.
-keepattributes Signature,*Annotation*,EnclosingMethod,InnerClasses
