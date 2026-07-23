import 'package:go_router/go_router.dart';
import '../../features/safety/presentation/safety_dashboard_screen.dart';
import '../../features/safety/presentation/bac_monitor_screen.dart';
import '../../features/safety/presentation/sos_screen.dart';
import '../../features/payment/presentation/payment_screen.dart';
import '../../features/payment/presentation/recharge_screen.dart';
import '../../features/buddy_system/presentation/map_screen.dart';
import '../../features/buddy_system/presentation/buddy_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/settings_screen.dart';
import '../widgets/main_scaffold.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainScaffold(child: child),
      routes: [
        GoRoute(path: '/', builder: (_, __) => const SafetyDashboardScreen()),
        GoRoute(
          path: '/safety',
          builder: (_, __) => const SafetyDashboardScreen(),
        ),
        GoRoute(
          path: '/safety/bac',
          builder: (_, __) => const BacMonitorScreen(),
        ),
        GoRoute(path: '/safety/sos', builder: (_, __) => const SosScreen()),
        GoRoute(path: '/payment', builder: (_, __) => const PaymentScreen()),
        GoRoute(
          path: '/payment/recharge',
          builder: (_, __) => const RechargeScreen(),
        ),
        GoRoute(path: '/map', builder: (_, __) => const MapScreen()),
        GoRoute(path: '/map/buddy', builder: (_, __) => const BuddyScreen()),
        GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
        GoRoute(
          path: '/profile/settings',
          builder: (_, __) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
