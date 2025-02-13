import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AwardFrame extends StatelessWidget {
  const AwardFrame({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        height: 500,
        width: 450,
        child: Stack(
          children: [
            // Left SVG Image
            Positioned(
              left: 50,
              top: 50,
              child: SvgPicture.asset(
                'assets/frame3.svg',
                width: 100,
                height: 100,
              ),
            ),
            // Center SVG Image (Main Logo)
            Positioned(
              top: 100,
              left: (screenWidth - 450) / 2 + 125, // Center aligned within SizedBox
              child: SvgPicture.asset(
                'assets/frame1.svg',
                width: 200,
                height: 200,
              ),
            ),
            // Right SVG Image
            Positioned(
              right: 118,
              bottom: 260,
              child: SvgPicture.asset(
                'assets/frame2.svg',
                width: 100,
                height: 100,
              ),
            ),
            // 4th SVG and Text
            Positioned(
              right: 134,
              bottom: 130,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/frame4.svg',
                    width: 30,
                    height: 40,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "PLAYER",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            // 5th SVG and Text
            Positioned(
              right: 100,
              bottom: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/frame5.svg',
                    width: 70,
                    height: 50,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "GT I2351EGA5",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            // Text between 3rd and 4th SVG
            Positioned(
              right: 170,
              bottom: 70,
              child: const Text(
                "Prasad Vanjare",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
