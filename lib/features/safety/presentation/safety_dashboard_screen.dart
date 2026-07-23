import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../payment/presentation/providers/payment_providers.dart';

class SafetyDashboardScreen extends ConsumerWidget {
  const SafetyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentState = ref.watch(paymentProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          children: [
            _Header(balance: paymentState.balance),
            const SizedBox(height: 20),
            const _NfcCard(),
            const SizedBox(height: 14),
            const _BraceletStatus(),
            const SizedBox(height: 28),
            const _QuickActions(),
            const SizedBox(height: 28),
            _RecentActivity(history: paymentState.history),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.balance});
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48, height: 48,
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.person_outline, color: AppColors.primary, size: 26),
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello,', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
              Text('Alex Rivera', style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${balance.toStringAsFixed(2)}',
              style: const TextStyle(color: AppColors.primary, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('BALANCE', style: TextStyle(color: AppColors.textSecondary, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}

class _NfcCard extends StatelessWidget {
  const _NfcCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5B1D8E), Color(0xFFE040FB)],
        ),
      ),
      child: const Center(child: Icon(Icons.contactless, size: 72, color: Colors.white)),
    );
  }
}

class _BraceletStatus extends StatelessWidget {
  const _BraceletStatus();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 8, height: 8,
                decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle)),
              const SizedBox(width: 8),
              const Text('SYSTEM ONLINE',
                style: TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Bracelet: Active',
            style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Linked to NFC Wallet',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                child: const Text('SCAN ID'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Action {
  const _Action({required this.icon, required this.label, required this.route});
  final IconData icon;
  final String label;
  final String route;
}

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  static const _actions = [
    _Action(icon: Icons.add_card_outlined, label: 'Top Up\nFunds', route: '/payment/recharge'),
    _Action(icon: Icons.group_outlined, label: 'Find\nFriends', route: '/map/buddy'),
    _Action(icon: Icons.calendar_month_outlined, label: 'Festival\nLineup', route: '/map'),
    _Action(icon: Icons.shield_outlined, label: 'Safety\nSettings', route: '/safety/bac'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('QUICK ACTIONS',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.4)),
        const SizedBox(height: 14),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.25,
          children: [for (final a in _actions) _ActionTile(action: a)],
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({required this.action});
  final _Action action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(action.route),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(35),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(action.icon, color: AppColors.primary, size: 22),
            ),
            Text(action.label,
              style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600, height: 1.3)),
          ],
        ),
      ),
    );
  }
}

class _RecentActivity extends StatelessWidget {
  const _RecentActivity({required this.history});
  final List<Map<String, dynamic>> history;

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) return const SizedBox.shrink();
    final recent = history.take(3).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('RECENT ACTIVITY',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.4)),
            GestureDetector(
              onTap: () => context.go('/payment'),
              child: const Text('VIEW ALL',
                style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
        const SizedBox(height: 14),
        for (final tx in recent) _TxRow(tx: tx),
      ],
    );
  }
}

class _TxRow extends StatelessWidget {
  const _TxRow({required this.tx});
  final Map<String, dynamic> tx;

  @override
  Widget build(BuildContext context) {
    final amount = tx['amount'] as double;
    final isPositive = amount > 0;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 42, height: 42,
            decoration: BoxDecoration(
              color: isPositive ? AppColors.primary.withAlpha(35) : AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isPositive ? Icons.add_circle_outline : Icons.remove_circle_outline,
              color: isPositive ? AppColors.primary : AppColors.textSecondary,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tx['label'] as String,
                  style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600, fontSize: 15)),
                const SizedBox(height: 2),
                Text(tx['ts'] as String,
                  style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          ),
          Text(
            '${isPositive ? "+" : ""}\$${amount.abs().toStringAsFixed(2)}',
            style: TextStyle(
              color: isPositive ? AppColors.success : AppColors.textPrimary,
              fontWeight: FontWeight.bold, fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
