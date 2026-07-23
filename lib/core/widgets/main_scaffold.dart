import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key, required this.child});
  final Widget child;

  static const _tabs = [
    (icon: Icons.home_outlined, active: Icons.home, label: 'Home', route: '/'),
    (icon: Icons.map_outlined, active: Icons.map, label: 'Map', route: '/map'),
    (
      icon: Icons.contactless_outlined,
      active: Icons.contactless,
      label: 'Pay',
      route: '/payment',
    ),
    (
      icon: Icons.person_outline,
      active: Icons.person,
      label: 'Profile',
      route: '/profile',
    ),
  ];

  int _indexFor(BuildContext context) {
    final loc = GoRouterState.of(context).uri.path;
    if (loc.startsWith('/map')) return 1;
    if (loc.startsWith('/payment')) return 2;
    if (loc.startsWith('/profile')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final idx = _indexFor(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF2A2A3E), width: 1)),
        ),
        child: NavigationBar(
          selectedIndex: idx,
          onDestinationSelected: (i) => context.go(_tabs[i].route),
          destinations: [
            for (final tab in _tabs)
              NavigationDestination(
                icon: Icon(tab.icon),
                selectedIcon: Icon(tab.active, color: AppColors.primary),
                label: tab.label,
              ),
          ],
        ),
      ),
    );
  }
}
