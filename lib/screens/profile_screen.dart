import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Mon Profil',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
          ),

          // Profile Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: AppTheme.primaryColor,
                        child: const Text(
                          'LD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Léa Dubois',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Bracelet #SP-4827',
                              style: TextStyle(
                                color: AppTheme.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.successColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Connecté',
                                style: TextStyle(
                                  color: AppTheme.successColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Bracelet Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mon bracelet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _BraceletStat(
                                icon: Icons.battery_charging_full,
                                label: 'Batterie',
                                value: '85%',
                                color: AppTheme.successColor,
                              ),
                              _BraceletStat(
                                icon: Icons.bluetooth,
                                label: 'Signal BLE',
                                value: 'Bon',
                                color: AppTheme.primaryColor,
                              ),
                              _BraceletStat(
                                icon: Icons.sync,
                                label: 'Synchro',
                                value: '2 min',
                                color: AppTheme.secondaryColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Text('Tester connexion'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppTheme.dangerColor,
                                  ),
                                  child: const Text('Désactiver'),
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
            ),
          ),

          // Friends Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Mon groupe d\'amis',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('Ajouter'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _FriendAvatar(name: 'Marie', isOnline: true),
                        _FriendAvatar(name: 'Thomas', isOnline: true),
                        _FriendAvatar(name: 'Emma', isOnline: false),
                        _FriendAvatar(name: 'Lucas', isOnline: true),
                        _AddFriendButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Settings Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Paramètres',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Column(
                      children: [
                        _SettingsTile(
                          icon: Icons.notifications,
                          title: 'Notifications',
                          trailing: Switch(value: true, onChanged: (_) {}),
                        ),
                        const Divider(height: 1),
                        _SettingsTile(
                          icon: Icons.dark_mode,
                          title: 'Mode sombre',
                          trailing: Switch(value: false, onChanged: (_) {}),
                        ),
                        const Divider(height: 1),
                        _SettingsTile(
                          icon: Icons.location_on,
                          title: 'Partage position',
                          trailing: Switch(value: true, onChanged: (_) {}),
                        ),
                        const Divider(height: 1),
                        _SettingsTile(
                          icon: Icons.privacy_tip,
                          title: 'Confidentialité',
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        ),
                        const Divider(height: 1),
                        _SettingsTile(
                          icon: Icons.help,
                          title: 'FAQ / Aide',
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Logout
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.dangerColor,
                  side: const BorderSide(color: AppTheme.dangerColor),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Se déconnecter'),
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

class _BraceletStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _BraceletStat({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _FriendAvatar extends StatelessWidget {
  final String name;
  final bool isOnline;

  const _FriendAvatar({
    required this.name,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
                child: Text(
                  name[0],
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppTheme.successColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _AddFriendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[200],
            child: const Icon(
              Icons.add,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Ajouter',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget trailing;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.textSecondary),
      title: Text(title),
      trailing: trailing,
    );
  }
}
