import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UnallocatedAward extends StatefulWidget {
  const UnallocatedAward({Key? key}) : super(key: key);

  @override
  State<UnallocatedAward> createState() => _UnallocatedAwardState();
}

class _UnallocatedAwardState extends State<UnallocatedAward> {
  int selectedIndex = -1;
  int selectedTabIndex = -1;

  // Instance of HexagonPage
  final hexagonPage = HexagonPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          ClipPath(
            clipper: HexagonalBottomClipper(),
            child: Container(
              width: double.infinity,
              height: 140,
              color: const Color(0xFF050D10),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: _buildAwardItem("Documents", 0),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: _buildAwardItem("Awards", 1),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _buildAwardItem("Members", 2),
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
          const SizedBox(height: 20),
          _buildSearchBar(),
          const SizedBox(height: 20),
          _buildAllocatedUnallocatedTabs(),
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
              height: 7,
              width: 20,
              color: Colors.white,
            ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
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
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
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
    );
  }

  Widget _buildAllocatedUnallocatedTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSelectionItem("Unallocated", 0),
        _buildSelectionItem("Allocated", 1),
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

        // Use the instance if needed for further logic
        if (title == "Allocated") {
          print("HexagonPage instance created: $hexagonPage");
        }
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
              color: null,
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
      begin: Alignment.topLeft,
      end: Alignment.topRight,
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          'Popup Content Here',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class HexagonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hexagon Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
