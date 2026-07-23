import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import 'providers/safety_providers.dart';

class SosScreen extends ConsumerWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(sosControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.error,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emergency, size: 80, color: Colors.white),
              const SizedBox(height: 24),
              const Text(
                'Alerte SOS',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Envoi aux contacts d\'urgence par ordre de priorité',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 48),
              if (status == SosStatus.alertSent)
                const Text('✅ Alerte envoyée',
                    style: TextStyle(color: Colors.white, fontSize: 18))
              else ...[
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.error,
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  onPressed: () async {
                    HapticFeedback.heavyImpact();
                    await ref.read(sosControllerProvider.notifier).confirmSend();
                  },
                  child: const Text('J\'ai besoin d\'aide',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  onPressed: () {
                    ref.read(sosControllerProvider.notifier).reset();
                    context.pop();
                  },
                  child: const Text('Je vais bien', style: TextStyle(fontSize: 18)),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
