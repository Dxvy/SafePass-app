import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key, required this.child});
  final Widget child;

  static const _tabs = [
    (icon: Icons.shield_outlined, label: 'Sécurité', route: '/safety'),
    (icon: Icons.contactless_outlined, label: 'Paiement', route: '/payment'),
    (icon: Icons.map_outlined, label: 'Carte', route: '/map'),
    (icon: Icons.person_outline, label: 'Profil', route: '/profile'),
  ];

  int _indexFor(BuildContext context) {
    final loc = GoRouterState.of(context).uri.path;
    if (loc.startsWith('/payment')) return 1;
    if (loc.startsWith('/map')) return 2;
    if (loc.startsWith('/profile')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.surface,
        selectedIndex: _indexFor(context),
        onDestinationSelected: (i) => context.go(_tabs[i].route),
        destinations: [
          for (final tab in _tabs)
            NavigationDestination(icon: Icon(tab.icon), label: tab.label),
        ],
      ),
    );
  }
}
