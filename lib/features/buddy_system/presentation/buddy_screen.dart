import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_sizes.dart';

class BuddyScreen extends StatefulWidget {
  const BuddyScreen({super.key});

  @override
  State<BuddyScreen> createState() => _BuddyScreenState();
}

class _BuddyScreenState extends State<BuddyScreen> {
  final _buddies = [
    {'name': 'Camille', 'sharing': true},
    {'name': 'Hugo', 'sharing': true},
    {'name': 'Sophie', 'sharing': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buddy System')),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.screenPadding),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Partage de position',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Visible uniquement par vos amis du groupe. Suppression automatique en fin d\'événement (RGPD).',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Mes amis', style: Theme.of(context).textTheme.titleSmall),
          for (var i = 0; i < _buddies.length; i++)
            Semantics(
              label:
                  '${_buddies[i]['name']} — partage ${_buddies[i]['sharing'] == true ? 'activé' : 'désactivé'}',
              child: SwitchListTile(
                secondary: const Icon(
                  Icons.person_outline,
                  color: AppColors.accent,
                ),
                title: Text(_buddies[i]['name'] as String),
                subtitle: Text(
                  _buddies[i]['sharing'] == true
                      ? 'Position visible sur la carte'
                      : 'Partage désactivé',
                ),
                value: _buddies[i]['sharing'] as bool,
                onChanged: (v) => setState(() => _buddies[i]['sharing'] = v),
              ),
            ),
        ],
      ),
    );
  }
}
