import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_sizes.dart';
import 'widgets/sos_button.dart';
import 'widgets/bac_wellness_card.dart';
import 'widgets/heart_rate_card.dart';
import 'widgets/emergency_contacts_card.dart';

class SafetyDashboardScreen extends ConsumerWidget {
  const SafetyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sécurité')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.screenPadding),
          children: const [
            SosButton(),
            SizedBox(height: 16),
            BacWellnessCard(),
            HeartRateCard(),
            EmergencyContactsCard(),
          ],
        ),
      ),
    );
  }
}
