import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/safety_repository.dart';
import '../../domain/widmark_formula.dart';

final safetyRepositoryProvider = Provider<SafetyRepository>(
  (_) => DemoSafetyRepository(),
);

// --- Heart rate ---

final heartRateProvider = StreamProvider<int>((ref) {
  return ref.watch(safetyRepositoryProvider).heartRateStream;
});

// --- BAC state ---

class BacInputState {
  const BacInputState({
    this.drinksInGrams = 0,
    this.weightKg = 70,
    this.sex = SexAssignedAtBirth.unspecified,
    this.hoursSinceFirstDrink = 0,
    this.result,
  });

  final double drinksInGrams;
  final double weightKg;
  final SexAssignedAtBirth sex;
  final double hoursSinceFirstDrink;
  final WidmarkResult? result;

  BacInputState copyWith({
    double? drinksInGrams,
    double? weightKg,
    SexAssignedAtBirth? sex,
    double? hoursSinceFirstDrink,
    WidmarkResult? result,
  }) =>
      BacInputState(
        drinksInGrams: drinksInGrams ?? this.drinksInGrams,
        weightKg: weightKg ?? this.weightKg,
        sex: sex ?? this.sex,
        hoursSinceFirstDrink: hoursSinceFirstDrink ?? this.hoursSinceFirstDrink,
        result: result ?? this.result,
      );
}

class BacMonitorNotifier extends Notifier<BacInputState> {
  @override
  BacInputState build() => const BacInputState();

  Future<void> estimate({
    required double drinksInGrams,
    required double weightKg,
    required SexAssignedAtBirth sex,
    required double hoursSinceFirstDrink,
  }) async {
    final repo = ref.read(safetyRepositoryProvider);
    final result = await repo.estimateBac(
      drinksInGrams: drinksInGrams,
      weightKg: weightKg,
      sex: sex,
      hoursSinceFirstDrink: hoursSinceFirstDrink,
    );
    state = state.copyWith(
      drinksInGrams: drinksInGrams,
      weightKg: weightKg,
      sex: sex,
      hoursSinceFirstDrink: hoursSinceFirstDrink,
      result: result,
    );
  }
}

final bacMonitorProvider = NotifierProvider<BacMonitorNotifier, BacInputState>(
  BacMonitorNotifier.new,
);

// --- SOS / no-pulse ---

enum SosStatus { idle, holding, alertSent }

class SosNotifier extends Notifier<SosStatus> {
  @override
  SosStatus build() => SosStatus.idle;

  void startHold() => state = SosStatus.holding;
  void cancelHold() => state = SosStatus.idle;

  Future<void> confirmSend() async {
    final repo = ref.read(safetyRepositoryProvider);
    await repo.dispatchSosAlert(contactIds: []);
    state = SosStatus.alertSent;
  }

  void reset() => state = SosStatus.idle;
}

final sosControllerProvider = NotifierProvider<SosNotifier, SosStatus>(
  SosNotifier.new,
);
