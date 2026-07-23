import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../domain/widmark_formula.dart';
import '../providers/safety_providers.dart';

class BacWellnessCard extends ConsumerWidget {
  const BacWellnessCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bacMonitorProvider);
    final zone = state.result?.zone ?? BacZone.safe;
    final bac = state.result?.bac ?? 0.0;

    return Semantics(
      label:
          'Niveau de bien-être alcool : zone ${zone.name}, ${bac.toStringAsFixed(2)} g/L',
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppSizes.cardBorderRadius),
          onTap: () => context.push('/safety/bac'),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Color + icon — never color alone (colorblind accessibility)
                Icon(zone.icon, color: zone.color, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bien-être alcool',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        '${bac.toStringAsFixed(2)} g/L',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: zone.color,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: zone.color),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
