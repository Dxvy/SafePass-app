import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_sizes.dart';
import '../domain/widmark_formula.dart';
import 'providers/safety_providers.dart';

class BacMonitorScreen extends ConsumerStatefulWidget {
  const BacMonitorScreen({super.key});

  @override
  ConsumerState<BacMonitorScreen> createState() => _BacMonitorScreenState();
}

class _BacMonitorScreenState extends ConsumerState<BacMonitorScreen> {
  double _drinks = 0;
  double _weight = 70;
  SexAssignedAtBirth _sex = SexAssignedAtBirth.unspecified;
  double _hours = 0;

  @override
  Widget build(BuildContext context) {
    final bacState = ref.watch(bacMonitorProvider);
    final zone = bacState.result?.zone ?? BacZone.safe;

    return Scaffold(
      appBar: AppBar(title: const Text('Moniteur BAC')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Mandatory, non-dismissible disclaimer — EU MDR compliance
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.warning.withAlpha(30),
                border: Border.all(color: AppColors.warning),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: AppColors.warning),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Estimation indicative uniquement. Ne conduit pas, ne remplace pas un éthylotest homologué.',
                      style: TextStyle(color: AppColors.warning, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // BAC display — color + icon (WCAG colorblind rule)
            if (bacState.result != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(zone.icon, color: zone.color, size: 40),
                  const SizedBox(width: 12),
                  Text(
                    '${bacState.result!.bac.toStringAsFixed(2)} g/L',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: zone.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (bacState.result!.bac > 0)
                const Center(
                  child: Text(
                    '💧 Buvez de l\'eau entre chaque verre',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ),
              const SizedBox(height: 24),
            ],
            // Inputs
            Text(
              'Consommation (g d\'alcool pur)',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Slider(
              value: _drinks,
              min: 0,
              max: 120,
              divisions: 24,
              label: '${_drinks.round()} g',
              onChanged: (v) => setState(() => _drinks = v),
            ),
            Text('Poids (kg)', style: Theme.of(context).textTheme.labelMedium),
            Slider(
              value: _weight,
              min: 30,
              max: 150,
              divisions: 24,
              label: '${_weight.round()} kg',
              onChanged: (v) => setState(() => _weight = v),
            ),
            Text(
              'Heures depuis le premier verre',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Slider(
              value: _hours,
              min: 0,
              max: 12,
              divisions: 24,
              label: '${_hours.toStringAsFixed(1)} h',
              onChanged: (v) => setState(() => _hours = v),
            ),
            SegmentedButton<SexAssignedAtBirth>(
              segments: const [
                ButtonSegment(
                  value: SexAssignedAtBirth.male,
                  label: Text('Homme'),
                ),
                ButtonSegment(
                  value: SexAssignedAtBirth.unspecified,
                  label: Text('Non précisé'),
                ),
                ButtonSegment(
                  value: SexAssignedAtBirth.female,
                  label: Text('Femme'),
                ),
              ],
              selected: {_sex},
              onSelectionChanged: (s) => setState(() => _sex = s.first),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => ref
                  .read(bacMonitorProvider.notifier)
                  .estimate(
                    drinksInGrams: _drinks,
                    weightKg: _weight,
                    sex: _sex,
                    hoursSinceFirstDrink: _hours,
                  ),
              child: const Text('Estimer'),
            ),
          ],
        ),
      ),
    );
  }
}
