import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/payment_providers.dart';

class NfcTapOverlay extends ConsumerStatefulWidget {
  const NfcTapOverlay({super.key});

  @override
  ConsumerState<NfcTapOverlay> createState() => _NfcTapOverlayState();
}

class _NfcTapOverlayState extends ConsumerState<NfcTapOverlay> {
  bool _simulating = false;
  String? _lastResult;

  Future<void> _simulateTap() async {
    setState(() { _simulating = true; _lastResult = null; });
    HapticFeedback.mediumImpact();
    final ok = await ref.read(paymentProvider.notifier).pay(amount: 6.0);
    if (mounted) {
      setState(() {
        _simulating = false;
        _lastResult = ok ? '✅ Transaction réussie — 6,00 €' : '🔒 Paiement refusé';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final lockService = ref.watch(paymentLockServiceProvider);
    final isLocked = lockService.currentState.isLocked;

    return Semantics(
      label: 'Zone de simulation NFC. Appuyer pour simuler un tap de bracelet.',
      child: InkWell(
        onTap: _simulating ? null : _simulateTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(
                color: isLocked ? AppColors.error : AppColors.accent, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: _simulating
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isLocked ? Icons.lock_outline : Icons.contactless_outlined,
                        size: 40,
                        color: isLocked ? AppColors.error : AppColors.accent,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isLocked ? 'Paiement bloqué' : 'Approcher le bracelet',
                        style: TextStyle(
                            color: isLocked ? AppColors.error : AppColors.accent),
                      ),
                      if (_lastResult != null) ...[
                        const SizedBox(height: 4),
                        Text(_lastResult!,
                            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      ]
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
