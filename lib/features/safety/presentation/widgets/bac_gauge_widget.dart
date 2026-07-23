import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/widmark_formula.dart';

/// Reusable BAC arc gauge — works at any [size].
class BacGauge extends StatelessWidget {
  const BacGauge({
    super.key,
    required this.bac,
    required this.zone,
    this.size = 220,
  });

  final double bac;
  final BacZone zone;
  final double size;

  @override
  Widget build(BuildContext context) {
    final progress = (bac / 0.80).clamp(0.0, 1.0);
    final small = size < 120;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: BacGaugePainter(progress: progress, color: zone.color),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'CURRENT BAC',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: small ? 8.0 : 12.0,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    bac.toStringAsFixed(2),
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: small ? 22.0 : 52.0,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: small ? 3.0 : 8.0),
                    child: Text(
                      '%',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: small ? 11.0 : 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                zone == BacZone.safe
                    ? 'Safe'
                    : zone == BacZone.moderate
                    ? 'Moderate'
                    : 'High',
                style: TextStyle(
                  color: zone.color,
                  fontSize: small ? 10.0 : 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BacGaugePainter extends CustomPainter {
  const BacGaugePainter({required this.progress, required this.color});

  final double progress;
  final Color color;

  static const _startDeg = 150.0;
  static const _sweepDeg = 240.0;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final small = size.width < 120;
    final radius = size.width / 2 - (small ? 8.0 : 16.0);
    final strokeWidth = small ? 8.0 : 14.0;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final start = _startDeg * pi / 180;
    final sweep = _sweepDeg * pi / 180;

    canvas.drawArc(
      rect,
      start,
      sweep,
      false,
      Paint()
        ..color = const Color(0xFF2A2A3E)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );

    if (progress > 0.01) {
      canvas.drawArc(
        rect,
        start,
        sweep * progress,
        false,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(BacGaugePainter old) =>
      old.progress != progress || old.color != color;
}
