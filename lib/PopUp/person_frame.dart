import 'package:award/PopUp/individual_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PersonFrame extends StatelessWidget {
  final String dp;
  const PersonFrame({super.key, required this.dp});

  @override
  Widget build(BuildContext context) {
    print(dp);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SizedBox(
        width: screenWidth * 0.17,
        height: screenWidth * 0.17,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 4,
              bottom: -12,
              left: -4,
              right: 3,
              child: SvgPicture.asset(
                'assets/profile111.png',
                width: screenWidth * 0.17,
                height: screenWidth * 0.17,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.center,
                child: IndividualFrame(
                    width: screenWidth * 0.16,
                    height: screenWidth * 0.16,
                    imageUrl:
                        "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
              ),
            ),
          ],
        ));
  }
}

class ProfileFrame extends StatelessWidget {
  const ProfileFrame({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Container(
        // color: Colors.amber,
        width: 140,
        height: 145,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              // top: 10,
              // bottom: 0,
              // left: -5,
              // right: 5,
              top: 2,
              child: SvgPicture.asset(
                'assets/profile.svg',
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: -12,
              left: -19,
              right: -36,
              bottom: 0,
              child: Align(
                alignment: Alignment.center,
                child: IndividualFrame(
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.4,
                  imageUrl:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Elon_Musk_in_2023_%28cropped%29.jpg/440px-Elon_Musk_in_2023_%28cropped%29.jpg',
                ),
              ),
            ),
          ],
        ));
  }
}
