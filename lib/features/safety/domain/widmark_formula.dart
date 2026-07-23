import 'package:flutter/material.dart';

enum SexAssignedAtBirth { male, female, unspecified }

enum BacZone {
  safe,
  moderate,
  high;

  Color get color {
    switch (this) {
      case BacZone.safe:
        return const Color(0xFF38A169);
      case BacZone.moderate:
        return const Color(0xFFC05621);
      case BacZone.high:
        return const Color(0xFFE53E3E);
    }
  }

  IconData get icon {
    switch (this) {
      case BacZone.safe:
        return Icons.check_circle_outline;
      case BacZone.moderate:
        return Icons.warning_amber_outlined;
      case BacZone.high:
        return Icons.dangerous_outlined;
    }
  }
}

class WidmarkResult {
  const WidmarkResult({
    required this.bac,
    required this.zone,
    required this.rCoefficient,
    required this.alcoholPurchaseBlocked,
  });

  final double bac;
  final BacZone zone;
  final double rCoefficient;
  final bool alcoholPurchaseBlocked;
}

class WidmarkFormula {
  static const double _rMale = 0.70;
  static const double _rFemale = 0.55;
  static const double _rUnspecified = 0.615;

  // Elimination rate: ~0.15 g/L/h (average)
  static const double _eliminationRate = 0.15;

  static WidmarkResult estimate({
    required double drinksInGrams,
    required double weightKg,
    required SexAssignedAtBirth sex,
    required double hoursSinceFirstDrink,
  }) {
    if (hoursSinceFirstDrink < 0) {
      throw ArgumentError(
        'hoursSinceFirstDrink must be >= 0, got $hoursSinceFirstDrink',
      );
    }

    if (drinksInGrams <= 0 || weightKg <= 0) {
      return const WidmarkResult(
        bac: 0.0,
        zone: BacZone.safe,
        rCoefficient: _rUnspecified,
        alcoholPurchaseBlocked: false,
      );
    }

    final r = switch (sex) {
      SexAssignedAtBirth.male => _rMale,
      SexAssignedAtBirth.female => _rFemale,
      SexAssignedAtBirth.unspecified => _rUnspecified,
    };

    // Widmark formula: BAC = (alcohol_g / (weight_kg * r)) - (elimination_rate * hours)
    final raw =
        (drinksInGrams / (weightKg * r)) -
        (_eliminationRate * hoursSinceFirstDrink);
    final bac = raw < 0 ? 0.0 : raw;

    final zone = bac >= 0.80
        ? BacZone.high
        : bac >= 0.50
        ? BacZone.moderate
        : BacZone.safe;

    return WidmarkResult(
      bac: bac,
      zone: zone,
      rCoefficient: r,
      alcoholPurchaseBlocked: zone == BacZone.high,
    );
  }
}
