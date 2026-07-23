import 'dart:async';
import 'dart:math';
import '../domain/buddy_position.dart';

abstract class BuddyRepository {
  Stream<List<BuddyPosition>> get buddyPositionsStream;
  Future<void> sharePosition({required double lat, required double lng});
  Future<void> stopSharing();
}

class DemoBuddyRepository implements BuddyRepository {
  final _rng = Random();
  final _controller = StreamController<List<BuddyPosition>>.broadcast();

  // Base positions near Paris (demo festival)
  static const _base = [(lat: 48.866, lng: 2.333, name: 'Camille'), (lat: 48.865, lng: 2.335, name: 'Hugo')];

  DemoBuddyRepository() {
    _startEmitting();
  }

  void _startEmitting() async {
    while (!_controller.isClosed) {
      await Future.delayed(const Duration(seconds: 3));
      final positions = [
        for (final b in _base)
          BuddyPosition(
            userId: b.name,
            lat: b.lat + (_rng.nextDouble() - 0.5) * 0.001,
            lng: b.lng + (_rng.nextDouble() - 0.5) * 0.001,
            updatedAt: DateTime.now(),
          ),
      ];
      if (!_controller.isClosed) _controller.add(positions);
    }
  }

  @override
  Stream<List<BuddyPosition>> get buddyPositionsStream => _controller.stream;

  @override
  Future<void> sharePosition({required double lat, required double lng}) async {}

  @override
  Future<void> stopSharing() async {}

  void dispose() => _controller.close();
}
