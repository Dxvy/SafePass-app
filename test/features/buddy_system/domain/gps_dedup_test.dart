import 'package:flutter_test/flutter_test.dart';
import 'package:safepass/features/buddy_system/domain/buddy_position.dart';

void main() {
  group('GpsDeduplicator', () {
    late GpsDeduplicator dedup;
    final base = DateTime(2026, 7, 1, 12, 0, 0);

    setUp(() => dedup = GpsDeduplicator(windowSeconds: 5));

    test('accepts first position for a user', () {
      final pos = BuddyPosition(userId: 'u1', lat: 48.8, lng: 2.3, updatedAt: base);
      expect(dedup.accept(pos), isTrue);
    });

    test('rejects duplicate position within the dedup window', () {
      final pos = BuddyPosition(userId: 'u1', lat: 48.8, lng: 2.3, updatedAt: base);
      dedup.accept(pos);
      final dup = BuddyPosition(userId: 'u1', lat: 48.8, lng: 2.3, updatedAt: base.add(const Duration(seconds: 2)));
      expect(dedup.accept(dup), isFalse);
    });

    test('accepts position after the dedup window expires', () {
      final pos = BuddyPosition(userId: 'u1', lat: 48.8, lng: 2.3, updatedAt: base);
      dedup.accept(pos);
      final fresh = BuddyPosition(userId: 'u1', lat: 48.8, lng: 2.3, updatedAt: base.add(const Duration(seconds: 6)));
      expect(dedup.accept(fresh), isTrue);
    });

    test('accepts changed coordinates even within the window', () {
      final pos = BuddyPosition(userId: 'u1', lat: 48.8, lng: 2.3, updatedAt: base);
      dedup.accept(pos);
      final moved = BuddyPosition(userId: 'u1', lat: 48.9, lng: 2.4, updatedAt: base.add(const Duration(seconds: 1)));
      expect(dedup.accept(moved), isTrue);
    });

    test('tracks multiple users independently', () {
      final p1 = BuddyPosition(userId: 'u1', lat: 48.8, lng: 2.3, updatedAt: base);
      final p2 = BuddyPosition(userId: 'u2', lat: 48.9, lng: 2.4, updatedAt: base);
      expect(dedup.accept(p1), isTrue);
      expect(dedup.accept(p2), isTrue);
      expect(dedup.trackedUsers, 2);
    });

    test('clear() resets all tracked users', () {
      dedup.accept(BuddyPosition(userId: 'u1', lat: 48.8, lng: 2.3, updatedAt: base));
      dedup.clear();
      expect(dedup.trackedUsers, 0);
    });

    test('BudddyPosition equality is based on userId, lat, lng', () {
      final a = BuddyPosition(userId: 'u1', lat: 48.8, lng: 2.3, updatedAt: base);
      final b = BuddyPosition(userId: 'u1', lat: 48.8, lng: 2.3, updatedAt: base.add(const Duration(hours: 1)));
      expect(a, equals(b));
    });

    test('trackedUsers count after multiple distinct users', () {
      for (var i = 0; i < 5; i++) {
        dedup.accept(BuddyPosition(userId: 'user_$i', lat: 48.0 + i, lng: 2.0, updatedAt: base));
      }
      expect(dedup.trackedUsers, 5);
    });

    test('rejecting duplicate does not increment trackedUsers', () {
      final pos = BuddyPosition(userId: 'u1', lat: 48.8, lng: 2.3, updatedAt: base);
      dedup.accept(pos);
      final dup = BuddyPosition(userId: 'u1', lat: 48.8, lng: 2.3, updatedAt: base.add(const Duration(seconds: 1)));
      dedup.accept(dup);
      expect(dedup.trackedUsers, 1);
    });
  });
}
