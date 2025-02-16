import 'dart:math'; // Import dart:math for cos and sin
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg

class AwardPage extends StatelessWidget {
  const AwardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Hexagon with SVG in the center
            Container(
              width: 298,
              height: 258,
              child: CustomPaint(
                painter: HexagonPainter(),
                child: ClipPath(
                  clipper: HexagonClipper(),
                  child: SvgPicture.asset(
                    'assets/centre_profile.svg', // Replace with your SVG file path
                    width: 120, // Reduced size of SVG
                    height: 120, // Reduced size of SVG
                    fit: BoxFit
                        .scaleDown, // Ensure it fits within the bounds of the hexagon
                  ),
                ),
              ),
            ),

            // Left SVG positioned next to the hexagon
            Positioned(
              left: 0, // Position it near the left edge
              child: SvgPicture.asset(
                'assets/left_profile.svg', // Path to left SVG
                width: 60,
                height: 60,
                fit: BoxFit.scaleDown,
              ),
            ),

            // Right SVG positioned next to the hexagon
            Positioned(
              left: 100, // Position it near the right edge
              child: SvgPicture.asset(
                'assets/right_profile.svg', // Path to right SVG
                width: 160,
                height: 160,
                fit: BoxFit.scaleDown,
              ),
            ),

            const SizedBox(
                height: 10), // Add spacing between hexagon and bottom container

            // Bottom Container with custom shape
            CustomPaint(
              size: const Size(350, 60),
              painter: BottomShapePainter(),
            ),
          ],
        ),
      ),
    );
  }
}

// CustomPainter for Hexagon
class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..color = Colors.grey // Hexagon border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1; // Border width

    // Draw inner hexagon
    Path innerHexagonPath =
        _drawHexagon(size.width, size.height, size.width / 2, size.height / 2);
    canvas.drawPath(innerHexagonPath, borderPaint);

    // Draw outer hexagon (scaled out by a factor of 1.3)
    Path outerHexagonPath = _drawHexagon(
        size.width * 1.3, size.height * 1.3, size.width / 2, size.height / 2);
    canvas.drawPath(outerHexagonPath, borderPaint);
  }

  Path _drawHexagon(
      double width, double height, double centerX, double centerY) {
    Path path = Path();

    // Calculate the points for the hexagon
    double angle = (2 * pi) / 6;
    List<Offset> points = [];
    for (int i = 0; i < 6; i++) {
      double x = centerX + width / 2 * cos(i * angle);
      double y = centerY + height / 2 * sin(i * angle);
      points.add(Offset(x, y));
    }

    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < 6; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    path.close();

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// Custom Clipper for Hexagon
class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    // Calculate the points for the hexagon
    double angle = (2 * pi) / 6;
    List<Offset> points = [];
    for (int i = 0; i < 6; i++) {
      double x = width / 2 + width / 2 * cos(i * angle);
      double y = height / 2 + height / 2 * sin(i * angle);
      points.add(Offset(x, y));
    }

    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < 6; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Custom painter for the bottom shape with grey border
class BottomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black // Shape fill color
      ..style = PaintingStyle.fill // Fill the shape
      ..strokeWidth = 0.5;

    // Create another Paint object for the grey border
    Paint borderPaint = Paint()
      ..color = Colors.grey // Border color
      ..style = PaintingStyle.stroke // Border style
      ..strokeWidth = 1.0; // Border width

    // Shift the entire shape upward by 76 pixels
    canvas.translate(0, -76);

    Path path = Path();

    // Custom container shape
    path.moveTo(0, 0); // Top-left point
    path.lineTo(size.width * 0.1, size.height); // Slanting down to the left
    path.lineTo(size.width * 0.9, size.height); // Horizontal line at the bottom
    path.lineTo(size.width, 0); // Slanting up to the right
    path.close();

    // Draw the shape with the white fill
    canvas.drawPath(path, paint);

    // Draw the grey border
    canvas.drawPath(path, borderPaint);

    // Draw the first horizontal line
    Paint linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.5;

    double lineStartX = size.width * 0.1; // Align with hexagon start
    double lineEndX = size.width * 0.9; // Align with hexagon end

    // First line
    canvas.drawLine(
      Offset(lineStartX, size.height), // Start point
      Offset(lineEndX, size.height), // End point
      linePaint,
    );

    // Second line slightly below the first
    double lineOffset = 22.0; // Vertical spacing between the two lines
    double reducedLineEndX = size.width *
        0.7; // Reduce the length of the second line (adjust as needed)
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
