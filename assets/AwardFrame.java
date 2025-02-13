import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package

class AwardFrame extends StatelessWidget {
  const AwardFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SvgPicture.asset(
          'assets/your_svg_image.svg', // Path to your SVG file
          width: 100, // Adjust the width as needed
          height: 100, // Adjust the height as needed
        ),
      ),
    );
  }
}
