import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_sizes.dart';
import 'providers/payment_providers.dart';
import 'widgets/balance_card.dart';
import 'widgets/nfc_tap_overlay.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paiement'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_card_outlined),
            tooltip: 'Recharger',
            onPressed: () => context.push('/payment/recharge'),
          ),
        ],
      ),
      body: state.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(AppSizes.screenPadding),
              children: [
                BalanceCard(balance: state.balance),
                const SizedBox(height: 16),
                const NfcTapOverlay(),
                const SizedBox(height: 24),
                Text(
                  'Historique',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                for (final tx in state.history)
                  ListTile(
                    leading: Icon(
                      tx['amount'] > 0
                          ? Icons.add_circle_outline
                          : Icons.remove_circle_outline,
                      color: tx['amount'] > 0
                          ? AppColors.success
                          : AppColors.textSecondary,
                    ),
                    title: Text(tx['label'] as String),
                    subtitle: Text(tx['ts'] as String),
                    trailing: Text(
                      '${tx['amount'] > 0 ? '+' : ''}${(tx['amount'] as double).toStringAsFixed(2)} €',
                      style: TextStyle(
                        color: tx['amount'] > 0
                            ? AppColors.success
                            : AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
