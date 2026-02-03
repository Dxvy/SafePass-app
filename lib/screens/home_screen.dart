import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onNavigateToPayment;

  const HomeScreen({super.key, this.onNavigateToPayment});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.shield,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'SafePass',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // Bracelet status
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.successColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppTheme.successColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'Connecté',
                              style: TextStyle(
                                color: AppTheme.successColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Notifications
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.notifications_outlined),
                            onPressed: () {},
                          ),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppTheme.accentColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bracelet Card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _BraceletCard(),
            ),
          ),

          // Balance Card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _BalanceCard(onRecharge: onNavigateToPayment),
            ),
          ),

          // Quick Actions
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Actions rapides',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _QuickActionTile(
                        icon: Icons.add_circle_outline,
                        label: 'Recharger',
                        color: AppTheme.primaryColor,
                        onTap: onNavigateToPayment,
                      )),
                      const SizedBox(width: 12),
                      Expanded(child: _QuickActionTile(
                        icon: Icons.local_bar,
                        label: 'Alcoolémie',
                        color: AppTheme.warningColor,
                      )),
                      const SizedBox(width: 12),
                      Expanded(child: _QuickActionTile(
                        icon: Icons.people,
                        label: 'Mes amis',
                        color: AppTheme.secondaryColor,
                      )),
                      const SizedBox(width: 12),
                      Expanded(child: _QuickActionTile(
                        icon: Icons.map,
                        label: 'Carte',
                        color: AppTheme.accentColor,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Recent History
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Historique récent',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Voir tout'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _TransactionItem(
                    icon: Icons.local_bar,
                    title: 'Bar Central',
                    time: '21:45',
                    amount: '-8,00 €',
                    color: AppTheme.warningColor,
                  ),
                  _TransactionItem(
                    icon: Icons.fastfood,
                    title: 'Food Truck Pizza',
                    time: '20:30',
                    amount: '-12,50 €',
                    color: AppTheme.accentColor,
                  ),
                  _TransactionItem(
                    icon: Icons.add_circle,
                    title: 'Rechargement',
                    time: '18:00',
                    amount: '+50,00 €',
                    color: AppTheme.successColor,
                    isPositive: true,
                  ),
                ],
              ),
            ),
          ),

          // Alert Banner
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.secondaryColor,
                      AppTheme.secondaryColor.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.water_drop,
                      color: Colors.white,
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pensez à vous hydrater !',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Fontaine la plus proche à 50m',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}

class _BraceletCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.watch,
                color: AppTheme.primaryColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bracelet #SP-4827',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.battery_charging_full,
                        size: 16,
                        color: AppTheme.successColor,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '85%',
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.sync,
                        size: 16,
                        color: AppTheme.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Synchro il y a 2min',
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  final VoidCallback? onRecharge;

  const _BalanceCard({this.onRecharge});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppTheme.primaryColor, Color(0xFF8B7CF7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mon solde',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '29,50 €',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onRecharge,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppTheme.primaryColor,
                ),
                child: const Text('Recharger'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const _QuickActionTile({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final String amount;
  final Color color;
  final bool isPositive;

  const _TransactionItem({
    required this.icon,
    required this.title,
    required this.time,
    required this.amount,
    required this.color,
    this.isPositive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              amount,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: isPositive ? AppTheme.successColor : AppTheme.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
