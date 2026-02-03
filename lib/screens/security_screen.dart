import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Ma Sécurité',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
          ),

          // Alcohol Level Card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        'Niveau d\'alcoolémie',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: CircularProgressIndicator(
                              value: 0.45,
                              strokeWidth: 12,
                              backgroundColor: Colors.grey[200],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppTheme.warningColor,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const Text(
                                '45%',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.warningColor,
                                ),
                              ),
                              const Text(
                                'Modéré',
                                style: TextStyle(
                                  color: AppTheme.warningColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Estimation dégrisement : ~2h30',
                        style: TextStyle(color: AppTheme.textSecondary),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Voir détails'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Health Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: AppTheme.accentColor,
                    ),
                  ),
                  title: const Text('Fréquence cardiaque'),
                  subtitle: const Text('78 BPM - Normal'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            ),
          ),

          // SOS Button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                color: AppTheme.dangerColor.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.emergency,
                        color: AppTheme.dangerColor,
                        size: 48,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Urgence',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Contact d\'urgence : Marie D.',
                        style: TextStyle(color: AppTheme.textSecondary),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.dangerColor,
                          ),
                          child: const Text('SOS'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Useful Info
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.local_hospital, color: AppTheme.dangerColor),
                      title: const Text('Poste secours'),
                      subtitle: const Text('150m - Zone A'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.water_drop, color: AppTheme.secondaryColor),
                      title: const Text('Fontaine'),
                      subtitle: const Text('50m - Près scène principale'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}
