import 'package:flutter_test/flutter_test.dart';
import 'package:safepass/features/profile/domain/user_profile.dart';

void main() {
  group('ProfileValidator.validateDisplayName', () {
    test('returns null for a valid name', () {
      expect(ProfileValidator.validateDisplayName('Davy'), isNull);
    });

    test('returns error for empty string', () {
      expect(ProfileValidator.validateDisplayName(''), isNotNull);
    });

    test('returns error for whitespace-only string', () {
      expect(ProfileValidator.validateDisplayName('   '), isNotNull);
    });

    test('returns error for single-character name', () {
      expect(ProfileValidator.validateDisplayName('A'), isNotNull);
    });

    test('returns error for name > 50 characters', () {
      expect(ProfileValidator.validateDisplayName('A' * 51), isNotNull);
    });

    test('accepts exactly 50 characters', () {
      expect(ProfileValidator.validateDisplayName('A' * 50), isNull);
    });
  });

  group('ProfileValidator.validateYearOfBirth', () {
    final currentYear = DateTime.now().year;

    test('returns null for a valid year', () {
      expect(ProfileValidator.validateYearOfBirth(1995), isNull);
    });

    test('returns error for null', () {
      expect(ProfileValidator.validateYearOfBirth(null), isNotNull);
    });

    test('returns error for year before 1900', () {
      expect(ProfileValidator.validateYearOfBirth(1899), isNotNull);
    });

    test('returns error for user younger than 16', () {
      expect(ProfileValidator.validateYearOfBirth(currentYear - 15), isNotNull);
    });

    test('accepts user exactly 16 years old', () {
      expect(ProfileValidator.validateYearOfBirth(currentYear - 16), isNull);
    });
  });

  group('ProfileValidator.validateWeight', () {
    test('returns null when weight is not provided (optional)', () {
      expect(ProfileValidator.validateWeight(null), isNull);
    });

    test('returns null for a valid weight', () {
      expect(ProfileValidator.validateWeight(70.0), isNull);
    });

    test('returns error for weight < 30 kg', () {
      expect(ProfileValidator.validateWeight(29.9), isNotNull);
    });

    test('returns error for weight > 300 kg', () {
      expect(ProfileValidator.validateWeight(300.1), isNotNull);
    });

    test('accepts boundary weight of 30 kg', () {
      expect(ProfileValidator.validateWeight(30.0), isNull);
    });
  });

  group('UserProfile', () {
    const profile = UserProfile(
      id: 'test-id',
      displayName: 'Davy',
      yearOfBirth: 2000,
      consentGiven: true,
      weightKg: 75,
    );

    test('isProfileComplete is true when weight and consent are set', () {
      expect(profile.isProfileComplete, isTrue);
    });

    test('isProfileComplete is false without weight', () {
      const incomplete = UserProfile(
        id: 'x',
        displayName: 'Test',
        yearOfBirth: 1990,
        consentGiven: true,
      );
      expect(incomplete.isProfileComplete, isFalse);
    });

    test('copyWith preserves unchanged fields', () {
      final updated = profile.copyWith(displayName: 'Hugo');
      expect(updated.id, 'test-id');
      expect(updated.displayName, 'Hugo');
      expect(updated.weightKg, 75);
    });
  });
}
