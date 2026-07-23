import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/safety_providers.dart';

class HeartRateCard extends ConsumerWidget {
  const HeartRateCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hrAsync = ref.watch(heartRateProvider);

    return Semantics(
      label: 'Fréquence cardiaque en temps réel',
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(
                Icons.favorite_outline,
                color: AppColors.error,
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fréquence cardiaque',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    hrAsync.when(
                      data: (bpm) => Text(
                        '$bpm bpm',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      loading: () => const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      error: (_, __) => const Text('Lecture impossible'),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.monitor_heart_outlined,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
