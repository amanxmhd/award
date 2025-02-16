import 'package:award/PopUp/dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppDialogBox extends StatelessWidget {
  const AppDialogBox({
    super.key,
    this.content,
    this.title = "title",
    this.boxHeight,
    this.boxWidth,
    this.contentHeight,
    this.contentWidth,
    this.backgroundPadding = 7.0,
    this.titleHeight,
    this.titleWidth,
    this.titlePositionFromBottom,
    this.closeButtonPositionFromRight,
    this.closeButtonPositionFromTop,
    this.close = true,
    this.isTitle = true,
    this.transition = true,
    this.titleTwo,
    this.topRightIcon,
    this.titleStyle,
    this.isButton = false,
    this.buttonTitle,
    this.onTab,
    this.backgroundColor = Colors.transparent, // Default transparent
  });

  final Widget? content;
  final String? title;
  final double? boxHeight;
  final double? boxWidth;
  final double? contentHeight;
  final double? contentWidth;
  final double backgroundPadding;
  final double? titleWidth;
  final double? titleHeight;
  final double? titlePositionFromBottom;
  final double? closeButtonPositionFromRight;
  final double? closeButtonPositionFromTop;
  final bool close;
  final bool isTitle;
  final bool transition;
  final bool isButton;
  final String? titleTwo;
  final Widget? topRightIcon;
  final TextStyle? titleStyle;
  final String? buttonTitle;
  final VoidCallback? onTab;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final currentWidth = boxWidth ?? width;
    final currentHeight = boxHeight ?? height;

    return Material(
      child: Container(
        width: currentWidth,
        height: currentHeight,
        color: backgroundColor,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            // Background SVG
            SvgPicture.asset(
              'assets/diaa.svg',
              width: width,
              fit: BoxFit.fill,
            ),

            // Title Clip Path
            if (isTitle)
              Positioned(
                top: currentHeight * 0.0072,
                child: ClipPath(
                  clipper: AppDialogBoxTitleClipper(),
                  child: Container(
                    height: 46,
                    width: currentWidth - (currentWidth * 0.40),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffDE2234), Color(0xffBB0130)],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      title ?? '',
                      style: titleStyle ??
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),

            // Close Button (FIXED: Added Material widget)
            if (close)
              Positioned(
                right: closeButtonPositionFromRight ?? width * 0.04,
                top: closeButtonPositionFromTop ?? height * 0.02,
                child: Material(
                  color: Colors.transparent, // Keeps it visually the same
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: topRightIcon ??
                        Container(
                          height: 42,
                          width: 42,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xffDE2234), Color(0xffBB0130)],
                            ),
                          ),
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                  ),
                ),
              ),

            // Content
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: content,
            ),

            // Button (FIXED: Ensured a non-null function is passed)
            if (isButton)
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: DialogButton(
                  onPress: onTab ?? () {}, // Ensures a valid function is passed
                  title: buttonTitle ?? 'REMOVE',
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class AppDialogBoxTitleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.15, size.height);
    path.lineTo(size.width * 0.85, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
