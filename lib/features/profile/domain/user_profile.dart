class UserProfile {
  const UserProfile({
    required this.id,
    required this.displayName,
    required this.yearOfBirth,
    required this.consentGiven,
    this.weightKg,
  });

  final String id;
  final String displayName;
  final int yearOfBirth;
  final bool consentGiven;
  final double? weightKg;

  int get age => DateTime.now().year - yearOfBirth;

  bool get isProfileComplete => weightKg != null && consentGiven;

  UserProfile copyWith({
    String? displayName,
    int? yearOfBirth,
    bool? consentGiven,
    double? weightKg,
  }) {
    return UserProfile(
      id: id,
      displayName: displayName ?? this.displayName,
      yearOfBirth: yearOfBirth ?? this.yearOfBirth,
      consentGiven: consentGiven ?? this.consentGiven,
      weightKg: weightKg ?? this.weightKg,
    );
  }
}

class ProfileValidator {
  static String? validateDisplayName(String? value) {
    if (value == null || value.trim().isEmpty)
      return 'Le nom ne peut pas être vide';
    if (value.trim().length < 2) return 'Minimum 2 caractères';
    if (value.trim().length > 50) return 'Maximum 50 caractères';
    return null;
  }

  static String? validateYearOfBirth(int? year) {
    if (year == null) return 'Année de naissance requise';
    final currentYear = DateTime.now().year;
    if (year < 1900 || year > currentYear - 16) return 'Année invalide';
    return null;
  }

  static String? validateWeight(double? kg) {
    if (kg == null) return null; // optional field
    if (kg < 30 || kg > 300) return 'Poids invalide (30–300 kg)';
    return null;
  }
}
