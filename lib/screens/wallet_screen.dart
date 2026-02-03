import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

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
                  const Text(
                    'Paiement',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.history),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          // Balance Card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _WalletBalanceCard(),
            ),
          ),

          // Spending Graph
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _SpendingGraphCard(),
            ),
          ),

          // Quick Reload Options
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rechargement rapide',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _ReloadOption(amount: '10 €')),
                      const SizedBox(width: 12),
                      Expanded(child: _ReloadOption(amount: '20 €')),
                      const SizedBox(width: 12),
                      Expanded(child: _ReloadOption(amount: '50 €', isPopular: true)),
                      const SizedBox(width: 12),
                      Expanded(child: _ReloadOption(amount: '100 €')),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Custom Amount
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Montant personnalisé',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Entrer un montant',
                          suffixText: '€',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Payment Methods
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Moyen de paiement',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _PaymentMethodTile(
                    icon: Icons.apple,
                    title: 'Apple Pay',
                    subtitle: 'Paiement instantané',
                    isSelected: true,
                  ),
                  const SizedBox(height: 8),
                  _PaymentMethodTile(
                    icon: Icons.credit_card,
                    title: 'Carte bancaire',
                    subtitle: '•••• 4532',
                    isSelected: false,
                  ),
                  const SizedBox(height: 8),
                  _PaymentMethodTile(
                    icon: Icons.point_of_sale,
                    title: 'Borne physique',
                    subtitle: 'Entrée principale - 120m',
                    isSelected: false,
                  ),
                ],
              ),
            ),
          ),

          // Reload Button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    _showReloadConfirmation(context);
                  },
                  child: const Text(
                    'Recharger maintenant',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),

          // Statistics Preview
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _StatisticsPreview(),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }

  void _showReloadConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.successColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: AppTheme.successColor,
                size: 48,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Rechargement confirmé !',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '+50,00 € ajoutés à votre solde',
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Nouveau solde'),
                  const Text(
                    '79,50 €',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Retour à l\'accueil'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _WalletBalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.primaryColor, Color(0xFF8B7CF7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Solde disponible',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.watch, color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Text(
                      'Bracelet lié',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '29,50 €',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.trending_down, color: Colors.white70, size: 16),
              const SizedBox(width: 4),
              Text(
                '-20,50 € aujourd\'hui',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SpendingGraphCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dépenses par heure',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Détails'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _BarChart(height: 0.3, label: '18h'),
                  _BarChart(height: 0.5, label: '19h'),
                  _BarChart(height: 0.7, label: '20h'),
                  _BarChart(height: 0.4, label: '21h'),
                  _BarChart(height: 0.9, label: '22h', isHighlighted: true),
                  _BarChart(height: 0.2, label: '23h'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  final double height;
  final String label;
  final bool isHighlighted;

  const _BarChart({
    required this.height,
    required this.label,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: 80 * height,
          decoration: BoxDecoration(
            color: isHighlighted
                ? AppTheme.primaryColor
                : AppTheme.primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isHighlighted ? AppTheme.primaryColor : AppTheme.textSecondary,
            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class _ReloadOption extends StatelessWidget {
  final String amount;
  final bool isPopular;

  const _ReloadOption({
    required this.amount,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: isPopular
                  ? AppTheme.primaryColor.withOpacity(0.1)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isPopular ? AppTheme.primaryColor : Colors.grey[300]!,
                width: isPopular ? 2 : 1,
              ),
            ),
            child: Center(
              child: Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isPopular ? AppTheme.primaryColor : AppTheme.textPrimary,
                ),
              ),
            ),
          ),
        ),
        if (isPopular)
          Positioned(
            top: -8,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Populaire',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _PaymentMethodTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;

  const _PaymentMethodTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? AppTheme.primaryColor : Colors.transparent,
          width: 2,
        ),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.primaryColor.withOpacity(0.1)
                : Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: AppTheme.primaryColor)
            : const Icon(Icons.circle_outlined, color: Colors.grey),
      ),
    );
  }
}

class _StatisticsPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Statistiques',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Voir plus'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    label: 'Total dépensé',
                    value: '70,50 €',
                    icon: Icons.payments,
                    color: AppTheme.accentColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatItem(
                    label: 'Transactions',
                    value: '8',
                    icon: Icons.receipt_long,
                    color: AppTheme.secondaryColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatItem(
                    label: 'Moyenne',
                    value: '8,80 €',
                    icon: Icons.analytics,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppTheme.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
