import 'package:award/Pages/update_award.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllocatedAward extends StatefulWidget {
  const AllocatedAward({Key? key}) : super(key: key);

  @override
  State<AllocatedAward> createState() => _AllocatedAwardState();
}

class _AllocatedAwardState extends State<AllocatedAward> {
  int selectedIndex = -1;
  int selectedTabIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              ClipPath(
                clipper: HexagonalBottomClipper(),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  color: const Color(0xFF050D10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: _buildAwardItem("Main", 0),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: _buildAwardItem("Matches", 1),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _buildAwardItem("Leaderboard", 2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomPaint(
                size: const Size(double.infinity, 0),
                painter: HexagonalBorderPainter(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 26),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Here',
                          hintStyle: const TextStyle(
                            color: Color(0xFFC5D1D8),
                            fontSize: 14,
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w300,
                          ),
                          filled: true,
                          fillColor: Colors.black,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF656464)),
                            borderRadius: BorderRadius.zero,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF605E5E)),
                            borderRadius: BorderRadius.zero,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.zero,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 17),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      height: 58,
                      width: 56,
                      decoration: const BoxDecoration(
                        color: Color(0xffd51933),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 36,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: const PopupBar(),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildAllocatedUnallocatedTabs(),
            ],
          ),
          Positioned(
            top: 40,
            left: 25,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        UpdateAward(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // Slide transition from left
                      const begin =
                          Offset(-1.0, 0.0); // Start off-screen (left)
                      const end = Offset.zero; // End at the original position
                      const curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: const Color(0xFFC00530),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAwardItem(String title, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white54,
              fontSize: 18,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            SvgPicture.asset(
              'assets/under_white.svg',
              height: 6,
              width: 20,
            ),
        ],
      ),
    );
  }

  Widget _buildAllocatedUnallocatedTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSelectionItem("Allocated", 0),
        _buildSelectionItem("Unallocated", 1),
      ],
    );
  }

  Widget _buildSelectionItem(String title, int index) {
    bool isSelected = selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white54,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            SvgPicture.asset(
              'assets/under_red_in.svg',
              height: 6,
              width: 20,
            ),
        ],
      ),
    );
  }
}

class HexagonalBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width - 70, size.height);
    path.lineTo(70, size.height);
    path.lineTo(0, size.height - 40);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HexagonalBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      colors: [
        const Color(0x00000000),
        const Color(0xFFBB0130),
        const Color(0xFFBB0130),
        const Color(0xFFBB0130),
        const Color(0xFFBB0130),
        const Color(0xFFBB0130),
        const Color(0x00000000),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    Paint paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, size.height - 40, size.width, 40),
      )
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..moveTo(size.width, size.height - 40)
      ..lineTo(size.width - 70, size.height)
      ..lineTo(70, size.height)
      ..lineTo(0, size.height - 40);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PopupBar extends StatelessWidget {
  const PopupBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.white,
      child: const Center(
        child: Text('Popup Content'),
      ),
    );
  }
}
