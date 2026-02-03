import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Map placeholder
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green[100]!,
                  Colors.green[50]!,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map,
                    size: 80,
                    color: AppTheme.primaryColor.withOpacity(0.3),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Carte interactive',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Festival SafePass 2024',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.textSecondary.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Search bar
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher un lieu...',
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),

          // Filter chips
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _FilterChip(label: 'Tout', isSelected: true),
                  _FilterChip(label: 'Bars', icon: Icons.local_bar),
                  _FilterChip(label: 'Scènes', icon: Icons.music_note),
                  _FilterChip(label: 'Toilettes', icon: Icons.wc),
                  _FilterChip(label: 'Secours', icon: Icons.local_hospital),
                  _FilterChip(label: 'Mes amis', icon: Icons.people),
                ],
              ),
            ),
          ),

          // Floating buttons
          Positioned(
            right: 16,
            bottom: 100,
            child: Column(
              children: [
                FloatingActionButton.small(
                  heroTag: 'layers',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.layers, color: AppTheme.textPrimary),
                ),
                const SizedBox(height: 8),
                FloatingActionButton.small(
                  heroTag: 'location',
                  onPressed: () {},
                  backgroundColor: AppTheme.primaryColor,
                  child: const Icon(Icons.my_location, color: Colors.white),
                ),
              ],
            ),
          ),

          // Bottom sheet preview
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.warningColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.local_bar,
                          color: AppTheme.warningColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bar Central',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.successColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    'Ouvert',
                                    style: TextStyle(
                                      color: AppTheme.successColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  '~5 min d\'attente',
                                  style: TextStyle(
                                    color: AppTheme.textSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            '120m',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          const Text(
                            '~2 min',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.directions),
                          label: const Text('Y aller'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.share),
                          label: const Text('Partager'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isSelected;

  const _FilterChip({
    required this.label,
    this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 16,
                color: isSelected ? Colors.white : AppTheme.textSecondary,
              ),
              const SizedBox(width: 4),
            ],
            Text(label),
          ],
        ),
        selected: isSelected,
        onSelected: (_) {},
        selectedColor: AppTheme.primaryColor,
        checkmarkColor: Colors.white,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : AppTheme.textPrimary,
        ),
      ),
    );
  }
}
