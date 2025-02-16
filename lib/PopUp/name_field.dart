import 'package:award/PopUp/ellipse_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NameFields extends StatelessWidget {
  final String name;
  final String id;
  final bool isAdded; // New parameter to check if the user is added

  const NameFields({
    super.key,
    required this.name,
    required this.id,
    this.isAdded = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 15,
            letterSpacing: 0.56,
            color: Color.fromRGBO(227, 227, 227, 1),
            fontFamily: 'Jost',
          ),
        ),
        // Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     SizedBox(
        //       child: SvgPicture.asset('assets/rect.svg'),
        //     ),
        //     Text(
        //       id,
        //       style: const TextStyle(
        //         fontSize: 8,
        //         letterSpacing: .8,
        //       ),
        //       textAlign: TextAlign.center,
        //     )
        //   ],
        // ),
        Stack(
          //alignment: Alignment.center,
          children: [
            Container(
              color: Color(0xffFF0606).withOpacity(0.6),
              height: 20,
              width: 85,
            ),
            CustomPaint(
              size: Size(30, 10),
              painter: EllipsePainter(fillColor: Colors.black),
              child: SizedBox(
                width: 85,
                height: 20,
                child: Center(
                  child: Text(id,
                      style: const TextStyle(
                        fontSize: 8,
                        letterSpacing: .8,
                      ),
                      textAlign: TextAlign.center),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 3,
        ),
        if (isAdded) // Conditionally show "Already added" row
          Row(
            children: [
              const Icon(Icons.check, color: Color(0xff00BE07), size: 15),
              const SizedBox(width: 2),
              const Text(
                'Already added',
                style: TextStyle(fontSize: 9, letterSpacing: .18),
              ),
            ],
          ),
      ],
    );
  }
}
