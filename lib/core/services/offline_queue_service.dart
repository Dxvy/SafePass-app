/// Queues NFC payment operations while offline, replays when connectivity is restored.
/// Stub implementation — real version uses Hive for persistence.
class OfflineQueueService {
  final _queue = <Map<String, dynamic>>[];

  void enqueue(Map<String, dynamic> operation) => _queue.add(operation);

  List<Map<String, dynamic>> drain() {
    final ops = List<Map<String, dynamic>>.from(_queue);
    _queue.clear();
    return ops;
  }

  bool get hasPending => _queue.isNotEmpty;
  int get pendingCount => _queue.length;
}
