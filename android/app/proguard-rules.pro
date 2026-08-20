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

# Reflection metadata some plugins rely on for JSON (de)serialization.
-keepattributes Signature,*Annotation*,EnclosingMethod,InnerClasses
