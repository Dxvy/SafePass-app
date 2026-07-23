import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_sizes.dart';
import 'providers/payment_providers.dart';

class RechargeScreen extends ConsumerWidget {
  const RechargeScreen({super.key});

  static const _amounts = [10.0, 20.0, 30.0, 50.0];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recharger le bracelet')),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.screenPadding),
        child: Column(
          children: [
            Text('Choisissez un montant',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 24),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                for (final amount in _amounts)
                  FilledButton(
                    onPressed: () async {
                      await ref.read(paymentProvider.notifier).topUp(amount: amount);
                      if (context.mounted) context.pop();
                    },
                    child: Text('+${amount.toStringAsFixed(0)} €',
                        style: const TextStyle(fontSize: 20)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
