import 'dart:async';
import 'dart:math';

/// Stub BLE service — in Demo Mode emits simulated heart-rate data.
class BleService {
  BleService({required bool demoMode}) : _demoMode = demoMode;

  final bool _demoMode;
  StreamController<int>? _hrController;

  Stream<int> get heartRateStream {
    if (_demoMode) return _simulatedHeartRate();
    // Real BLE implementation would subscribe to flutter_blue_plus here
    return const Stream.empty();
  }

  Stream<int> _simulatedHeartRate() async* {
    final rng = Random();
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      yield 60 + rng.nextInt(40); // 60–100 bpm demo range
    }
  }

  Future<bool> get isConnected async => _demoMode;

  void dispose() {
    _hrController?.close();
  }
}
