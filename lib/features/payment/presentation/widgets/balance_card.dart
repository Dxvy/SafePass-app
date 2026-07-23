import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key, required this.balance});
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Solde du bracelet : ${balance.toStringAsFixed(2)} euros',
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Icon(Icons.account_balance_wallet_outlined,
                  size: 40, color: AppColors.accent),
              const SizedBox(height: 8),
              Text('Solde disponible',
                  style: Theme.of(context).textTheme.labelLarge),
              Text(
                '${balance.toStringAsFixed(2)} €',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.accent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
