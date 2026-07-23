import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_sizes.dart';
import '../providers/safety_providers.dart';

class SosButton extends ConsumerWidget {
  const SosButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Semantics(
      label: 'Bouton SOS. Maintenir 3 secondes pour déclencher une alerte.',
      button: true,
      child: GestureDetector(
        onLongPressStart: (_) {
          HapticFeedback.heavyImpact();
          ref.read(sosControllerProvider.notifier).startHold();
        },
        onLongPressEnd: (_) {
          ref.read(sosControllerProvider.notifier).cancelHold();
        },
        onLongPress: () {
          HapticFeedback.heavyImpact();
          context.push('/safety/sos');
        },
        child: Container(
          width: AppSizes.sosButtonSize,
          height: AppSizes.sosButtonSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.error,
            boxShadow: [
              BoxShadow(
                color: Color(0x66E53E3E),
                blurRadius: 20,
                spreadRadius: 4,
              ),
            ],
          ),
          child: const Icon(
            Icons.emergency,
            size: 48,
            color: Colors.white,
            semanticLabel: null, // handled by parent Semantics
          ),
        ),
      ),
    );
  }
}
