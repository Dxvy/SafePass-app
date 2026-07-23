import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Paramètres',
            onPressed: () => context.push('/profile/settings'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.screenPadding),
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.accent,
            child: Icon(Icons.person, size: 48, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('Davy Marthely',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.badge_outlined, color: AppColors.accent),
            title: const Text('ID bracelet'),
            subtitle: const Text('SP-DEMO-2026'),
            trailing: const Icon(Icons.copy_outlined, size: 18),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined, color: AppColors.accent),
            title: const Text('Consentement RGPD'),
            subtitle: const Text('Consenti le 01/07/2026'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline, color: AppColors.warning),
            title: const Text('Supprimer mes données'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
