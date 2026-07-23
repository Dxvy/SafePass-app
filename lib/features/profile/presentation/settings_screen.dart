import 'package:flutter/material.dart';
import '../../../core/theme/app_sizes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _fontSize = 1.0; // textScaleFactor multiplier
  bool _darkMode = true;
  bool _hapticFeedback = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.screenPadding),
        children: [
          Text('Apparence', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          // Accessible font size control — RGAA requirement
          Semantics(
            label: 'Taille de police : ${(_fontSize * 100).round()} %',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Taille de police : ${(_fontSize * 100).round()} %',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Slider(
                  value: _fontSize,
                  min: 0.8,
                  max: 1.5,
                  divisions: 7,
                  label: '${(_fontSize * 100).round()} %',
                  onChanged: (v) => setState(() => _fontSize = v),
                ),
              ],
            ),
          ),
          SwitchListTile(
            title: const Text('Thème sombre'),
            value: _darkMode,
            onChanged: (v) => setState(() => _darkMode = v),
          ),
          const Divider(),
          Text('Accessibilité', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Retour haptique'),
            subtitle: const Text('Vibrations sur les alertes SOS et no-pulse'),
            value: _hapticFeedback,
            onChanged: (v) => setState(() => _hapticFeedback = v),
          ),
        ],
      ),
    );
  }
}
