import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../design_system/shell/viora_app_shell.dart';
import '../design_system/theme/theme_controller.dart';
import '../../features/home/presentation/home_dashboard_screen.dart';
import '../../features/calendar/presentation/calendar_screen.dart';
import '../../features/tasks/presentation/tasks_screen.dart';
import '../../features/projects/presentation/projects_screen.dart';
import '../../features/goals/presentation/goals_screen.dart';
import '../../features/habits/presentation/habits_screen.dart';
import '../../features/focus/presentation/focus_screen.dart';
import '../../features/money/presentation/money_screen.dart';
import '../../features/journal/presentation/journal_screen.dart';
import '../../features/analytics/presentation/analytics_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/more/presentation/more_screen.dart';
import '../../features/timeline/presentation/timeline_screen.dart';
import '../../features/health/presentation/health_screen.dart';
import '../../features/education/presentation/education_screen.dart';
import '../../features/career/presentation/career_screen.dart';
import '../../features/business/presentation/business_screen.dart';
import '../../features/transport/presentation/transport_screen.dart';
import '../../features/activity/presentation/activity_screen.dart';
import '../../features/communications/presentation/communications_screen.dart';
import '../../features/reports/presentation/reports_screen.dart';
import '../../features/ai_coach/presentation/ai_coach_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final themeMode = ref.watch(themeModeProvider);
          return VioraAppShell(
            currentPath: state.matchedLocation,
            onNavigate: (path) => context.go(path),
            themeMode: themeMode,
            onToggleTheme: () => ref.read(themeModeProvider.notifier).toggle(),
            child: child,
          );
        },
        routes: [
          GoRoute(path: '/', builder: (context, state) => const HomeDashboardScreen()),
          GoRoute(path: '/calendar', builder: (context, state) => const CalendarScreen()),
          GoRoute(path: '/tasks', builder: (context, state) => const TasksScreen()),
          GoRoute(path: '/projects', builder: (context, state) => const ProjectsScreen()),
          GoRoute(path: '/goals', builder: (context, state) => const GoalsScreen()),
          GoRoute(path: '/habits', builder: (context, state) => const HabitsScreen()),
          GoRoute(path: '/focus', builder: (context, state) => const FocusScreen()),
          GoRoute(path: '/money', builder: (context, state) => const MoneyScreen()),
          GoRoute(path: '/journal', builder: (context, state) => const JournalScreen()),
          GoRoute(path: '/analytics', builder: (context, state) => const AnalyticsScreen()),
          GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
          GoRoute(path: '/more', builder: (context, state) => const MoreScreen()),
          GoRoute(path: '/timeline', builder: (context, state) => const TimelineScreen()),
          GoRoute(path: '/health', builder: (context, state) => const HealthScreen()),
          GoRoute(path: '/education', builder: (context, state) => const EducationScreen()),
          GoRoute(path: '/career', builder: (context, state) => const CareerScreen()),
          GoRoute(path: '/business', builder: (context, state) => const BusinessScreen()),
          GoRoute(path: '/transport', builder: (context, state) => const TransportScreen()),
          GoRoute(path: '/activity', builder: (context, state) => const ActivityScreen()),
          GoRoute(path: '/communications', builder: (context, state) => const CommunicationsScreen()),
          GoRoute(path: '/reports', builder: (context, state) => const ReportsScreen()),
          GoRoute(path: '/ai-coach', builder: (context, state) => const AiCoachScreen()),
        ],
      ),
    ],
  );
});
