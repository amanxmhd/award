import 'package:award/Frames/profile_frame.dart';
import 'package:award/Pages/allocated_award.dart';
import 'package:award/Pages/tournament_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpdateAward extends StatefulWidget {
  const UpdateAward({super.key});

  @override
  State<UpdateAward> createState() => _UpdateAwardState();
}

class _UpdateAwardState extends State<UpdateAward> {
  int _currentIndex = 0;
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header container with custom clipper
            ClipPath(
              clipper: HexagonalBottomClipper(),
              child: Container(
                width: double.infinity,
                height: 125,
                color: Color(0xFF050D10),
                child: CustomPaint(
                  painter: HexagonalBorderPainter(),
                  child: Stack(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        centerTitle: true,
                        title: Padding(
                          padding: const EdgeInsets.only(top: 38.0),
                          child: SizedBox(
                            width: 177,
                            height: 27,
                            child: Text(
                              'UPDATE AWARD',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.80,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 20),
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Color(0xFFC00530),
                            size: 24,
                          ),
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0, top: 27),
                            child: SvgPicture.asset(
                              'assets/delete.svg',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 30,
                        left: 70,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => TournamentPage(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  // Fade transition
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Publish",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 30,
                        right: 70,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => AllocatedAward(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  // Slide transition from the bottom
                                  const begin = Offset(0.0, 1.0); // Start off-screen (bottom)
                                  const end = Offset.zero; // End at the original position
                                  const curve = Curves.easeInOut;

                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);

                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Preview",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row with the red bar and "AWARD NAME"
                  RedBar(heading: 'AWARD NAME',),

                  SizedBox(height: 26),

                  SizedBox(
                    height: 55,
                    width: 500,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 70,
                      physics: FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: ['OPTION 1', 'OPTION 2', 'OPTION 3', 'CUSTOM'].length,
                        builder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: _currentIndex == index ? Color(0xFFC1192E) : Color(0xFF212121),
                              borderRadius: BorderRadius.zero,
                            ),
                            child: Text(
                              ['OPTION 1', 'OPTION 2', 'OPTION 3', 'CUSTOM'][index],
                              style: TextStyle(
                                color: _currentIndex == index ? Colors.white : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 10),




                  TextField(
                    decoration: InputDecoration(
                      labelText: 'AWARD NAME',
                      labelStyle: TextStyle(
                        color: Color(0xFF868686), // Set the label color
                      ),
                      filled: true,
                      fillColor: Colors.black, // Box color
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF868686)),
                        borderRadius: BorderRadius.zero, // No rounding, sharp corners
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF868686)),
                        borderRadius: BorderRadius.zero, // No rounding, sharp corners
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC1192E)),
                        borderRadius: BorderRadius.zero, // No rounding, sharp corners
                      ),
                    ),
                    style: TextStyle(color: Color(0xFFFFFFFF)), // Ensure text input color matches
                  ),


                  SizedBox(height: 26),
                  // Award Description Section

                  RedBar(heading: 'AWARD DESCRIPTION',),

                  SizedBox(height: 26),
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      maxLength: 1500,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Write about the award description',
                        hintStyle: TextStyle(
                          color: Color(0xa1ffffff),
                          fontSize: 12,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.48,
                        ),
                        filled: true,
                        fillColor: Colors.black,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 12,
                            24), // Adjust padding to prevent overlap
                      ),
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),

                  SizedBox(height: 26),
                  RedBar(heading: 'AWARD WINNERS',),
                  SizedBox(height: 20),
                  PlusRed(),
                  SizedBox(height: 26),

                  ProfileImageRow(count: 4,),

                  SizedBox(height: 20),
                  RedBar(heading: 'AWARD SPONSORS',),
                  SizedBox(height: 20),
                  PlusRed(),
                  SizedBox(height: 26),

                  RedBar(heading: 'AWARD ORGANIZERS',),

                  SizedBox(height: 20),
                  PlusRed(),
                  SizedBox(height: 26),
                  ProfileImageRow(count: 2),
                  SizedBox(height: 20),
                  RedBar(heading: 'WINNING AMOUNT',),

                  SizedBox(height: 26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // TextField inside a SizedBox
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '99999',
                            hintStyle: TextStyle(
                              color: Color(0xFFC5D1D8),
                              fontSize: 14,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w300,
                            ),
                            filled: true,
                            fillColor: Colors.black,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF868686)),
                              borderRadius:
                              BorderRadius.zero, // Ensures sharp edges
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF3A3939)),
                              borderRadius:
                              BorderRadius.zero, // Ensures sharp edges
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                              BorderRadius.zero, // Ensures sharp edges
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                          ),
                          style: TextStyle(color: Color(0xFFFFFFFF)),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 58,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color:
                                    Colors.grey), // Fixed border property
                              ),
                              child: Center(
                                child: Text(
                                  'INR',
                                  style: TextStyle(
                                    color: Color(0xFFC1192E),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 80),

                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Outer container for border effect
                        Container(
                          width: 369,
                          height: 51,
                          decoration: BoxDecoration(
                            color: Colors.black, // Outer border color
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        // Inner container with gradient background
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: const Color(0xff9cb4c6)),
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xffde2234),
                                border: Border.all(color: const Color(0xff090909), width: 3),
                              ),
                              child: const Text(
                                "UPDATE",
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class ProfileImageRow extends StatefulWidget {
  final int count;
  const ProfileImageRow({
    super.key, required this.count,
  });

  @override
  State<ProfileImageRow> createState() => _ProfileImageRowState();
}

class _ProfileImageRowState extends State<ProfileImageRow> {
  late List<Widget> iconList;

  @override
  void initState() {
    super.initState();
    iconList = [];
    iconList = List.generate(widget.count, (_) => ProfileWithRedCross(
      onPressed: removeProfile,
    ));
  }

  void removeProfile() {
    if (iconList.isNotEmpty) {
      setState(() {
        iconList.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: iconList,
        ),
      ],
    );
  }
}


class RedBar extends StatelessWidget {
  final String heading;
  const RedBar({
    super.key,
    required this.heading
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Red bar SVG at the start
        SvgPicture.asset(
          'assets/red_bar.svg',
          width: 8,
          height: 40,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 12),
        Text(
          heading,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class PlusRed extends StatelessWidget {
  const PlusRed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // TextField inside a SizedBox
        Expanded(
          // width: 380,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Here',
              hintStyle: TextStyle(
                color: Color(0xFFC5D1D8),
                fontSize: 14,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w300,
              ),
              filled: true,
              fillColor: Colors.black,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF868686)),
                borderRadius: BorderRadius.zero, // Sharp corners
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF868686)),
                borderRadius: BorderRadius.zero, // Sharp corners
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.zero, // Sharp corners
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 12, vertical: 15),
            ),
          ),
        ),

        SizedBox(width: 5),

        Container(
          height: 54,
          width: 56,
          decoration: BoxDecoration(
            color: Color(0xffd51933),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 36,
          ),
        ),
      ],
    );
  }
}

// Custom clipper for hexagonal bottom corners
class HexagonalBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0); // Top left corner
    path.lineTo(size.width, 0); // Top right corner
    path.lineTo(
        size.width, size.height - 40); // Move down 40 pixels from the right
    path.lineTo(size.width - 70, size.height); // Bottom right sharp cut
    path.lineTo(70, size.height); // Bottom left sharp cut
    path.lineTo(0, size.height - 40); // Move up 40 pixels from the left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// CustomPainter to draw a border along the hexagonal bottom corners
class HexagonalBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF161C1E)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..moveTo(
          size.width, size.height - 40) // Start at the right bottom sharp cut
      ..lineTo(size.width - 70, size.height) // Bottom right sharp cut
      ..lineTo(70, size.height) // Bottom left sharp cut
      ..lineTo(0, size.height - 40); // Move up to the left sharp cut

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}