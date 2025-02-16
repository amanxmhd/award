import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class IndividualFrame extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;

  const IndividualFrame({
    super.key,
    required this.width,
    required this.height,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipPath(
            clipper: UserProfileImageFrameClipper(),
            child: imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    width: width / 1.1,
                    height: height / 1.1,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/profile111.png',
                    width: width / 1.1,
                    height: height / 1.1,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            top: 4,
            right: 0.1,
            child: CustomPaint(
              size: Size(width, height),
              painter: IndividualFramePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfileImageFrameClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.47, size.height * 0.06);
    path_0.lineTo(size.width * 0.09, size.height * 0.225);
    path_0.lineTo(size.width * 0.17, size.height * 0.7904714);
    path_0.lineTo(size.width * 0.48, size.height * 0.99);
    path_0.lineTo(size.width * 0.78, size.height * 0.8);
    path_0.lineTo(size.width * 0.85, size.height * 0.225);
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class IndividualFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.524, size.height * 0.872);
    path_0.lineTo(size.width * 0.186, size.height * 0.666);
    path_0.lineTo(size.width * 0.111, size.height * 0.152);
    path_0.cubicTo(
      size.width * 0.128,
      size.height * 0.139,
      size.width * 0.147,
      size.height * 0.129,
      size.width * 0.166,
      size.height * 0.120,
    );
    path_0.cubicTo(
      size.width * 0.220,
      size.height * 0.094,
      size.width * 0.277,
      size.height * 0.076,
      size.width * 0.336,
      size.height * 0.065,
    );
    path_0.lineTo(size.width * 0.152, size.height * 0.148);
    path_0.lineTo(size.width * 0.220, size.height * 0.577);
    path_0.lineTo(size.width * 0.524, size.height * 0.856);
    path_0.lineTo(size.width * 0.830, size.height * 0.577);
    path_0.lineTo(size.width * 0.896, size.height * 0.148);
    path_0.lineTo(size.width * 0.710, size.height * 0.066);
    path_0.cubicTo(
      size.width * 0.769,
      size.height * 0.077,
      size.width * 0.826,
      size.height * 0.095,
      size.width * 0.881,
      size.height * 0.120,
    );
    path_0.cubicTo(
      size.width * 0.901,
      size.height * 0.129,
      size.width * 0.920,
      size.height * 0.140,
      size.width * 0.938,
      size.height * 0.152,
    );
    path_0.lineTo(size.width * 0.867, size.height * 0.666);
    path_0.lineTo(size.width * 0.524, size.height * 0.872);
    path_0.lineTo(size.width * 0.524, size.height * 0.872);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5245792, size.height * 0.06502054),
        Offset(size.width * 0.5245792, size.height * 0.8727662), [
      Color(0xffC5D1D8).withOpacity(1),
      Color(0xffE9E9E9).withOpacity(1),
      Color(0xff868A8D).withOpacity(1)
    ], [
      0,
      0.205,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.544, size.height * 0.838);
    path_1.lineTo(size.width * 0.830, size.height * 0.577);
    path_1.lineTo(size.width * 0.895, size.height * 0.149);
    path_1.cubicTo(
      size.width * 0.895,
      size.height * 0.149,
      size.width * 0.909,
      size.height * 0.241,
      size.width * 0.910,
      size.height * 0.241,
    );
    path_1.lineTo(size.width * 0.830, size.height * 0.635);
    path_1.lineTo(size.width * 0.544, size.height * 0.838);
    path_1.close();

    path_1.moveTo(size.width * 0.499, size.height * 0.836);
    path_1.lineTo(size.width * 0.216, size.height * 0.635);
    path_1.lineTo(size.width * 0.136, size.height * 0.242);
    path_1.cubicTo(
      size.width * 0.136,
      size.height * 0.242,
      size.width * 0.136,
      size.height * 0.241,
      size.width * 0.136,
      size.height * 0.241,
    );
    path_1.cubicTo(
      size.width * 0.138,
      size.height * 0.240,
      size.width * 0.153,
      size.height * 0.149,
      size.width * 0.153,
      size.height * 0.149,
    );
    path_1.lineTo(size.width * 0.216, size.height * 0.577);
    path_1.lineTo(size.width * 0.499, size.height * 0.836);
    path_1.lineTo(size.width * 0.499, size.height * 0.836);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5229500, size.height * 0.2290297),
        Offset(size.width * 0.5229500, size.height * 0.8380473), [
      Color(0xffC4C6C6).withOpacity(1),
      Color(0xffE9E9E9).withOpacity(1),
      Color(0xff565656).withOpacity(1)
    ], [
      0,
      0.54,
      1
    ]);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.524, size.height * 0.856);
    path_2.lineTo(size.width * 0.825, size.height * 0.57);
    path_2.lineTo(size.width * 0.87, size.height * 0.161);
    path_2.lineTo(size.width * 0.519, size.height * 0.001);
    path_2.lineTo(size.width * 0.168, size.height * 0.161);
    path_2.lineTo(size.width * 0.230, size.height * 0.595);
    path_2.lineTo(size.width * 0.524, size.height * 0.856);
    path_2.close();

    path_2.moveTo(size.width * 0.524, size.height * 0.858);
    path_2.lineTo(size.width * 0.232, size.height * 0.596);
    path_2.lineTo(size.width * 0.169, size.height * 0.160);
    path_2.lineTo(size.width * 0.518, size.height * 0.0);
    path_2.lineTo(size.width * 0.87, size.height * 0.160);
    path_2.lineTo(size.width * 0.825, size.height * 0.57);
    path_2.lineTo(size.width * 0.524, size.height * 0.858);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Color(0xffBCBCBC).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
