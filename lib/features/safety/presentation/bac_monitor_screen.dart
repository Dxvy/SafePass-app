import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../domain/widmark_formula.dart';
import 'providers/safety_providers.dart';
import 'widgets/bac_gauge_widget.dart';

class BacMonitorScreen extends ConsumerStatefulWidget {
  const BacMonitorScreen({super.key});

  @override
  ConsumerState<BacMonitorScreen> createState() => _BacMonitorScreenState();
}

class _BacMonitorScreenState extends ConsumerState<BacMonitorScreen>
    with SingleTickerProviderStateMixin {
  double _drinks = 10;
  double _weight = 70;
  SexAssignedAtBirth _sex = SexAssignedAtBirth.unspecified;
  double _hours = 1;
  bool _showInputs = false;

  late AnimationController _pulseController;
  late Animation<double> _pulseScale;
  late Animation<double> _pulseOpacity;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _pulseScale = Tween<double>(begin: 1.0, end: 1.06).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _pulseOpacity = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(bacMonitorProvider.notifier)
          .estimate(
            drinksInGrams: _drinks,
            weightKg: _weight,
            sex: _sex,
            hoursSinceFirstDrink: _hours,
          );
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bacMonitorProvider);
    final bac = state.result?.bac ?? 0.04;
    final zone = state.result?.zone ?? BacZone.safe;
    final isCritical = zone == BacZone.high;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Safety Monitor',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.textPrimary,
              size: 18,
            ),
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(
          children: [
            const SizedBox(height: 12),
            BacGauge(bac: bac, zone: zone),
            const SizedBox(height: 24),

            // Pulsing SOS button — only shown when BAC is critical
            if (isCritical) ...[
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) => Transform.scale(
                  scale: _pulseScale.value,
                  child: Opacity(opacity: _pulseOpacity.value, child: child),
                ),
                child: Semantics(
                  label: 'SOS Emergency. Press to call for help immediately.',
                  button: true,
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        HapticFeedback.heavyImpact();
                        context.push('/safety/sos');
                      },
                      icon: const Icon(Icons.emergency, size: 22),
                      label: const Text(
                        'SOS Emergency',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 0.5,
                        ),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.error,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        shadowColor: AppColors.error.withAlpha(160),
                        elevation: 8,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],

            _StatusCard(zone: zone),
            const SizedBox(height: 12),
            _TimeCard(hours: _hours),
            const SizedBox(height: 12),
            const _HydrationCard(),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: () => setState(() => _showInputs = !_showInputs),
              icon: Icon(
                _showInputs ? Icons.expand_less : Icons.edit_outlined,
                color: AppColors.primary,
                size: 18,
              ),
              label: Text(
                _showInputs ? 'Hide inputs' : 'Update my data',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (_showInputs) ...[
              const SizedBox(height: 8),
              _InputsCard(
                drinks: _drinks,
                weight: _weight,
                sex: _sex,
                hours: _hours,
                onDrinksChanged: (v) => setState(() => _drinks = v),
                onWeightChanged: (v) => setState(() => _weight = v),
                onSexChanged: (v) => setState(() => _sex = v),
                onHoursChanged: (v) => setState(() => _hours = v),
                onEstimate: () => ref
                    .read(bacMonitorProvider.notifier)
                    .estimate(
                      drinksInGrams: _drinks,
                      weightKg: _weight,
                      sex: _sex,
                      hoursSinceFirstDrink: _hours,
                    ),
              ),
            ],
            const SizedBox(height: 20),
            // MDR disclaimer — mandatory, non-dismissible
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.warning.withAlpha(25),
                border: Border.all(color: AppColors.warning.withAlpha(80)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: AppColors.warning, size: 16),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Indicative estimate only. Do not drive. Does not replace a certified breathalyser.',
                      style: TextStyle(color: AppColors.warning, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_hospital_outlined,
                    color: AppColors.primary,
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Find Nearest First Aid Station',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
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

// ── Status card ───────────────────────────────────────────────────────────────

class _StatusCard extends StatelessWidget {
  const _StatusCard({required this.zone});

  final BacZone zone;

  @override
  Widget build(BuildContext context) {
    final isSafe = zone == BacZone.safe;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isSafe ? Icons.check_circle : zone.icon,
                color: isSafe ? AppColors.success : zone.color,
                size: 22,
              ),
              const SizedBox(width: 10),
              Text(
                isSafe
                    ? 'Safe to go'
                    : zone == BacZone.moderate
                    ? 'Be careful'
                    : 'High level — rest',
                style: TextStyle(
                  color: isSafe ? AppColors.success : zone.color,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            isSafe
                ? 'You are currently within legal limits. Please continue to monitor your intake and drink responsibly.'
                : zone == BacZone.moderate
                ? 'Alcohol purchase has been monitored. Drink water and rest before any activity.'
                : 'Your NFC payment for alcohol is blocked. Please hydrate and find a SafePass staff member.',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'View Legal Guidelines',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Time card ─────────────────────────────────────────────────────────────────

class _TimeCard extends StatelessWidget {
  const _TimeCard({required this.hours});

  final double hours;

  @override
  Widget build(BuildContext context) {
    final soberIn = (2.5 - hours).clamp(0.0, 10.0);
    final soberH = soberIn.floor();
    final soberM = ((soberIn - soberH) * 60).round();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.access_time_outlined,
                color: AppColors.textSecondary,
                size: 20,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Last drink time',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
              const Text(
                '10:45 PM',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Divider(color: Color(0xFF2A2A3E), height: 20),
          Row(
            children: [
              const Icon(
                Icons.timer_outlined,
                color: AppColors.textSecondary,
                size: 20,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Estimated sober time',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
              Text(
                soberH > 0
                    ? '${soberH}h ${soberM}m'
                    : soberM > 0
                    ? '${soberM}m'
                    : 'Sober',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
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

// ── Hydration card ────────────────────────────────────────────────────────────

class _HydrationCard extends StatelessWidget {
  const _HydrationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hydration Suggestion',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Drink 500ml of water before your next alcoholic beverage to stay balanced.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 14),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle_outline, size: 16),
                  label: const Text('Log 500ml Water'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                    side: const BorderSide(color: Color(0xFF2A2A3E)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(40),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.water_drop_outlined,
              color: AppColors.primary,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Inputs card ───────────────────────────────────────────────────────────────

class _InputsCard extends StatelessWidget {
  const _InputsCard({
    required this.drinks,
    required this.weight,
    required this.sex,
    required this.hours,
    required this.onDrinksChanged,
    required this.onWeightChanged,
    required this.onSexChanged,
    required this.onHoursChanged,
    required this.onEstimate,
  });

  final double drinks, weight, hours;
  final SexAssignedAtBirth sex;
  final ValueChanged<double> onDrinksChanged, onWeightChanged, onHoursChanged;
  final ValueChanged<SexAssignedAtBirth> onSexChanged;
  final VoidCallback onEstimate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alcohol (g)',
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: AppColors.textSecondary),
          ),
          Slider(
            value: drinks,
            min: 0,
            max: 120,
            divisions: 24,
            activeColor: AppColors.primary,
            label: '${drinks.round()} g',
            onChanged: onDrinksChanged,
          ),
          Text(
            'Weight (kg)',
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: AppColors.textSecondary),
          ),
          Slider(
            value: weight,
            min: 30,
            max: 150,
            divisions: 24,
            activeColor: AppColors.primary,
            label: '${weight.round()} kg',
            onChanged: onWeightChanged,
          ),
          Text(
            'Hours since first drink',
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: AppColors.textSecondary),
          ),
          Slider(
            value: hours,
            min: 0,
            max: 12,
            divisions: 24,
            activeColor: AppColors.primary,
            label: '${hours.toStringAsFixed(1)} h',
            onChanged: onHoursChanged,
          ),
          SegmentedButton<SexAssignedAtBirth>(
            segments: const [
              ButtonSegment(value: SexAssignedAtBirth.male, label: Text('M')),
              ButtonSegment(
                value: SexAssignedAtBirth.unspecified,
                label: Text('N/A'),
              ),
              ButtonSegment(value: SexAssignedAtBirth.female, label: Text('F')),
            ],
            selected: {sex},
            onSelectionChanged: (s) => onSexChanged(s.first),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith(
                (s) => s.contains(WidgetState.selected)
                    ? AppColors.primary.withAlpha(60)
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onEstimate,
              style: FilledButton.styleFrom(backgroundColor: AppColors.primary),
              child: const Text(
                'Estimate',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
