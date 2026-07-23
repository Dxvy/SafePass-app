class BuddyPosition {
  const BuddyPosition({
    required this.userId,
    required this.lat,
    required this.lng,
    required this.updatedAt,
  });

  final String userId;
  final double lat;
  final double lng;
  final DateTime updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuddyPosition &&
          userId == other.userId &&
          lat == other.lat &&
          lng == other.lng;

  @override
  int get hashCode => Object.hash(userId, lat, lng);
}

class GpsDeduplicator {
  GpsDeduplicator({this.windowSeconds = 5});

  final int windowSeconds;

  final _seen = <String, BuddyPosition>{};

  /// Returns true and updates cache if position is new or stale enough.
  /// Returns false when position is a duplicate within the dedup window.
  bool accept(BuddyPosition position) {
    final previous = _seen[position.userId];
    if (previous == null) {
      _seen[position.userId] = position;
      return true;
    }
    final elapsed = position.updatedAt.difference(previous.updatedAt).inSeconds;
    if (elapsed >= windowSeconds ||
        previous.lat != position.lat ||
        previous.lng != position.lng) {
      _seen[position.userId] = position;
      return true;
    }
    return false;
  }

  void clear() => _seen.clear();
  int get trackedUsers => _seen.length;
}
