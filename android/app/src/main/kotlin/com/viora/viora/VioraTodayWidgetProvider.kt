package com.viora.viora

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider

/**
 * "Today" home-screen widget: active task count + minutes focused today.
 * Data is written from Dart via `home_widget`'s SharedPreferences bridge
 * (see [HomeWidgetService] in lib/core/services) whenever those numbers
 * change; this provider just renders whatever was last written.
 */
class VioraTodayWidgetProvider : HomeWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.viora_today_widget)

            val taskCount = widgetData.getString("today_task_count", "0") ?: "0"
            val focusMinutes = widgetData.getString("today_focus_minutes", "0") ?: "0"
            val updatedAt = widgetData.getString("today_updated_label", "") ?: ""

            views.setTextViewText(R.id.widget_task_count, taskCount)
            views.setTextViewText(R.id.widget_focus_minutes, "${focusMinutes}m")
            views.setTextViewText(R.id.widget_updated_at, updatedAt)

            val pendingIntent: PendingIntent? = HomeWidgetLaunchIntent.getActivity(
                context,
                MainActivity::class.java
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
