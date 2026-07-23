import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/theme/app_colors.dart';
import '../data/buddy_repository.dart';
import '../domain/buddy_position.dart';

final _buddyRepoProvider = Provider<BuddyRepository>((_) => DemoBuddyRepository());

final _buddiesProvider = StreamProvider<List<BuddyPosition>>((ref) {
  return ref.watch(_buddyRepoProvider).buddyPositionsStream;
});

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buddiesAsync = ref.watch(_buddiesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Carte & Buddy System')),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(48.866, 2.333),
          initialZoom: 16,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.safepass.app',
          ),
          MarkerLayer(
            markers: [
              // My position marker
              const Marker(
                point: LatLng(48.8665, 2.3335),
                child: Icon(Icons.my_location, color: AppColors.accent, size: 32),
              ),
              // Buddy markers
              ...buddiesAsync.when(
                data: (buddies) => buddies
                    .map((b) => Marker(
                          point: LatLng(b.lat, b.lng),
                          child: Semantics(
                            label: 'Position de ${b.userId}',
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.person_pin_circle,
                                    color: AppColors.success, size: 28),
                                Text(b.userId,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
                loading: () => [],
                error: (_, __) => [],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
