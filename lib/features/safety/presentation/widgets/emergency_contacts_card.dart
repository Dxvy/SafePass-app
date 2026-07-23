import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class EmergencyContactsCard extends StatelessWidget {
  const EmergencyContactsCard({super.key});

  // Demo contacts — replaced by Supabase data in production
  static const _contacts = [
    (name: 'SAMU', number: '15', icon: Icons.local_hospital_outlined),
    (name: 'Pompiers', number: '18', icon: Icons.fire_truck_outlined),
    (name: 'Sécurité festival', number: 'Staff', icon: Icons.security_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Contacts d\'urgence',
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Contacts d\'urgence',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              for (final c in _contacts)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(c.icon, color: AppColors.accent),
                  title: Text(c.name),
                  trailing: Text(c.number,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: AppColors.accent)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
