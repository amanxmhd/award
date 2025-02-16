import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class EllipsePainter extends CustomPainter {
  final Color fillColor;

  EllipsePainter({
    required this.fillColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Save the canvas layer to apply blur without affecting other drawings
    canvas.saveLayer(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..imageFilter = ImageFilter.blur(sigmaX: 20, sigmaY: 10), // Blur effect
    );

    // Draw the ellipse with no stroke (filled only)
    final Paint fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    // Adjust the ellipse rect to avoid artifacts (center it properly)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2), // Center of canvas
        width: size.width,
        height: size.height,
      ),
      fillPaint,
    );

    // Restore the canvas after applying effects
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
