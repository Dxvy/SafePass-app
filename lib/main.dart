import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/security_screen.dart';
import 'screens/map_screen.dart';
import 'screens/profile_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const SafePassApp());
}

class SafePassApp extends StatelessWidget {
  const SafePassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafePass',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  void _navigateToPayment() {
    setState(() {
      _currentIndex = 1;
    });
  }

  List<Widget> get _screens => [
    HomeScreen(onNavigateToPayment: _navigateToPayment),
    const WalletScreen(),
    const SecurityScreen(),
    const MapScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: IndexedStack(
          key: ValueKey<int>(_currentIndex),
          index: _currentIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF6C5CE7),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              activeIcon: Icon(Icons.account_balance_wallet),
              label: 'Paiement',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shield_outlined),
              activeIcon: Icon(Icons.shield),
              label: 'Sécurité',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              activeIcon: Icon(Icons.map),
              label: 'Carte',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
