import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HexagonPage extends StatelessWidget {
  const HexagonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        width: 400,
        child: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/Hex.svg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                top: 117,
                right: 0,
                left: 0,
                child: Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/profile_frame.svg',
                        fit: BoxFit.cover,
                        height: 130,
                        width: 120,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 14),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/under_black.png'),
                            fit: BoxFit.contain, // adjust the fit as needed
                          ),
                        ),
                        child: Text(
                          "AWARD NAME FULLLLLLL",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 92),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/under_white.png'),
                            fit: BoxFit.cover, // adjust the fit as needed
                          ),
                        ),
                        child: Text(
                          "AWARD NAME FULLLLLLL",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
