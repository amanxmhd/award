import 'package:award/Frames/award_frame.dart';
import 'package:award/Frames/hexagoan_page.dart';
import 'package:award/Pages/update_award.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the SVG package

class TournamentPage extends StatefulWidget {
  const TournamentPage({super.key});

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  bool isExpanded = false;
  String selectedOption = ''; // Declare the selectedOption variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with hexagonal design
            ClipPath(
              clipper: HexagonalBottomClipper(),
              child: Container(
                width: double.infinity,
                height: 125,
                color: Color(0xFF050D10), // Background color of the header
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Award Name Full Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 25,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      UpdateAward(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                // Slide transition from left
                                const begin = Offset(
                                    -1.0, 0.0); // Start off-screen (left)
                                const end =
                                    Offset.zero; // End at the original position
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
                          color: Color(0xFFC00530),
                          size: 24,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 26,
                      right: 85,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      UpdateAward(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(
                                    0.0, 1.0); // Start off-screen (bottom)
                                const end =
                                    Offset.zero; // End at the original position
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
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            CustomPaint(
              size: Size(double.infinity, 0), // Height of the line
              painter: HexagonalBorderPainter(),
            ),

            SizedBox(height: 40),

            Container(
              child: Center(
                child: Text(
                  "Full Tournament Name",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Brink',
                    letterSpacing: 2.5,
                    color: Color(0xFFF1F1F1), // Updated color to #F1F1F1
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              width: 455,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade900, // Grey background color
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFDA1E33), // Bottom stroke color
                    width: 1.5, // Thickness of the bottom stroke
                  ),
                ),
              ),
            ),

            // SVG positioned below the text and container
            Center(
              child: Positioned(
                child: SvgPicture.asset(
                  'assets/down_v.svg', // Path to your SVG file
                  width: 158, // Adjust width of the SVG
                  height: 28, // Adjust height of the SVG
                ),
              ),
            ),

            Stack(
              children: [
                HexagonPage(), // Base Hexagon Page

                Positioned(
                  left: 10.0,
                  top: 25.0,
                  child: SvgPicture.asset(
                    'assets/share.svg',
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  right: 10.0,
                  top: 25.0,
                  child: SvgPicture.asset(
                    'assets/Edit.svg',
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 43,
                  right: 32,
                  child: SvgPicture.asset(
                    'assets/pencil.svg',
                    width: 55,
                    height: 23,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row with the red bar and "AWARD NAME"
                  Row(
                    children: [
                      // Red bar SVG at the start
                      SvgPicture.asset(
                        'assets/red_bar.svg', // Ensure the SVG file path is correct
                        width: 8,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "AWARD DESCRIPTION",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.08,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height:
                          20), // Space between the award name and the lorem ipsum text
                  Align(
                    alignment: Alignment.centerLeft, // Align text to the left
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and a typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s.Lorem Ipsum is simply dummy text of the printing Lorem Ipsum text.',
                      style: TextStyle(
                        color: Color(0xFF707070),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines:
                          isExpanded ? null : 2, // Show all lines if expanded
                      overflow: isExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis, // Add ellipsis for overflow
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 19, top: 0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded; // Toggle expanded state
                    });
                  },
                  child: Text(
                    isExpanded ? 'VIEW LESS' : 'VIEW MORE',
                    style: TextStyle(
                      color: Color(0xFFC00530), // Red color for the button
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            Row(
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
                  "TOURNAMENT STATS",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 1.08,
                  ),
                ),
              ],
            ),

            SizedBox(height: 26),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: const [
            //     CommonStatCard(
            //       value: "224",
            //       label: "TOTAL KILLS",
            //       assetPath: 'assets/kills_under.svg',
            //     ),
            //     CommonStatCard(
            //       value: "4th",
            //       label: "POSITION",
            //       assetPath: 'assets/kills_under.svg',
            //       topLabelPosition: 70,
            //     ),
            //     CommonStatCard(
            //       value: "224",
            //       label: "TOTAL KILLS",
            //       assetPath: 'assets/kills_under.svg',
            //     ),
            //   ],
            // ),

            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
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
                    "MEMBERS",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 1.28,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 'Winner';
                      });
                    },
                    child: Column(
                      children: [
                        AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 300),
                          style: TextStyle(
                            color: selectedOption == 'Winner'
                                ? Colors.white
                                : Color(0xFFC5D1D8),
                            fontSize: selectedOption == 'Winner' ? 18 : 15,
                            fontFamily: 'Jost',
                            fontWeight: selectedOption == 'Winner'
                                ? FontWeight.w500
                                : FontWeight.w300,
                          ),
                          child: Text('Winner'),
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                scale: animation, child: child);
                          },
                          child: selectedOption == 'Winner'
                              ? SvgPicture.asset(
                                  'assets/down_block.svg',
                                  width: 80,
                                  height: 5,
                                  fit: BoxFit.cover,
                                  key: ValueKey('WinnerSVG'),
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 'Organizer';
                      });
                    },
                    child: Column(
                      children: [
                        AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 300),
                          style: TextStyle(
                            color: selectedOption == 'Organizer'
                                ? Colors.white
                                : Color(0xFFC5D1D8),
                            fontSize: selectedOption == 'Organizer' ? 18 : 15,
                            fontFamily: 'Jost',
                            fontWeight: selectedOption == 'Organizer'
                                ? FontWeight.w500
                                : FontWeight.w300,
                          ),
                          child: Text('Organizers'),
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 100),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                          child: selectedOption == 'Organizer'
                              ? SvgPicture.asset(
                                  'assets/down_block.svg',
                                  width: 80,
                                  height: 5,
                                  fit: BoxFit.cover,
                                  key: ValueKey('OrganizerSVG'),
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 'Sponsor';
                      });
                    },
                    child: Column(
                      children: [
                        AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 300),
                          style: TextStyle(
                            color: selectedOption == 'Sponsor'
                                ? Colors.white
                                : Color(0xFFC5D1D8),
                            fontSize: selectedOption == 'Sponsor' ? 20 : 15,
                            fontFamily: 'Jost',
                            fontWeight: selectedOption == 'Sponsor'
                                ? FontWeight.w500
                                : FontWeight.w300,
                          ),
                          child: Text('Sponsor'),
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 100),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                scale: animation, child: child);
                          },
                          child: selectedOption == 'Sponsor'
                              ? SvgPicture.asset(
                                  'assets/down_block.svg',
                                  width: 80,
                                  height: 5,
                                  fit: BoxFit.cover,
                                  key: ValueKey('SponsorSVG'),
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Align(
              alignment:
                  Alignment.centerLeft, // Aligns the container to the left side
              child: Positioned(
                child: Container(
                  height: 300,
                  width: 300,
                  child: Stack(
                    children: [
                      // Left SVG Image
                      Positioned(
                        left: 2,
                        top: 90,
                        child: SvgPicture.asset(
                          'assets/frame3.svg',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      // Center SVG Image (Main Logo)
                      Positioned(
                        top: 50,
                        left: 10, // Centered inside Container
                        child: SvgPicture.asset(
                          'assets/frame1.svg',
                          width: 150,
                          height: 150,
                        ),
                      ),
                      // Right SVG Image
                      Positioned(
                        right: 135,
                        bottom: 110,
                        child: SvgPicture.asset(
                          'assets/frame2.svg',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      // 4th SVG and Text
                      Positioned(
                        right: 128,
                        bottom: 29,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/frame4.svg',
                              width: 30,
                              height: 41,
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
                      Positioned(
                        right: 170,
                        bottom: 92,
                        child: const Text(
                          "Prasad Vanjare",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // 5th SVG and Text
                      Positioned(
                        right: 97,
                        bottom: 0,
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
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 26),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Red bar SVG at the start
                      SvgPicture.asset(
                        'assets/red_bar.svg',
                        width: 10,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "OTHER AWARDS",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 1.08,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  // First Container
                  Container(
                    width: 414,
                    height: 63,
                    color: Color(0xFF0E181B),
                    child: Stack(
                      children: [
                        // Champion League Award text at the start
                        Positioned(
                          left: 12,
                          top: 20,
                          child: Text(
                            'CHAMPION LEAGUE AWARD',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // "2 days ago" at the top-right corner
                        Positioned(
                          top: 4,
                          right: 13,
                          child: Row(
                            children: [
                              SizedBox(width: 4),
                              Text(
                                '2 days ago',
                                style: TextStyle(
                                  color: Color(0xFFC5D1D8),
                                  fontSize: 8,
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SVG icon at the bottom-left corner
                        Positioned(
                          bottom: 0, // Adjust to place it near the bottom
                          left: 0, // Adjust to position it on the left side
                          child: Stack(
                            clipBehavior: Clip.none, // Allow overflow if needed
                            children: [
                              // SVG positioned at the bottom
                              SvgPicture.asset(
                                'assets/down_red_bar.svg', // Replace with your SVG asset path
                                width: 14,
                                height: 15,
                              ),
                              // Text positioned above the SVG
                              Positioned(
                                top:
                                    2, // Adjust the vertical position of the text above the SVG
                                left: 11,
                                child: Text(
                                  "Tournament Name",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight
                                        .w500, // Fix FontWeight spelling
                                    color: Colors.white, // Set the text color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  // Second Container
                  Container(
                    width: 414,
                    height: 63,
                    color: Color(0xFF0E181B),
                    child: Stack(
                      children: [
                        // Champion League Award text at the start
                        Positioned(
                          left: 12,
                          top: 20,
                          child: Text(
                            'CHAMPION LEAGUE AWARD',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // "2 days ago" at the top-right corner
                        Positioned(
                          top: 4,
                          right: 13,
                          child: Row(
                            children: [
                              SizedBox(width: 4),
                              Text(
                                '2 days ago',
                                style: TextStyle(
                                  color: Color(0xFFC5D1D8),
                                  fontSize: 8,
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SVG icon at the bottom-left corner
                        Positioned(
                          bottom: 0, // Adjust to place it near the bottom
                          left: 0, // Adjust to position it on the left side
                          child: Stack(
                            clipBehavior: Clip.none, // Allow overflow if needed
                            children: [
                              // SVG positioned at the bottom
                              SvgPicture.asset(
                                'assets/down_red_bar.svg', // Replace with your SVG asset path
                                width: 14,
                                height: 15,
                              ),
                              // Text positioned above the SVG
                              Positioned(
                                top:
                                    3, // Adjust the vertical position of the text above the SVG
                                left: 11,
                                child: Text(
                                  "Tournament Name",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight
                                        .w500, // Fix FontWeight spelling
                                    color: Colors.white, // Set the text color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
                    "AWARDS STATUS",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 1.08,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            Container(
              width: 408,
              height: 123,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF8B8B8B), // Border color
                  width: 0.8, // Border width
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // Ensures equal space between rows
                children: [
                  // First section with SVG
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0), // Horizontal padding for spacing
                    child: Stack(
                      clipBehavior:
                          Clip.none, // Allow the stack to overflow if needed
                      children: [
                        // Row with SVG as the background
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/round_red_long.svg', // Replace with your SVG asset path
                              width: 49,
                              height: 20,
                            ),
                          ],
                        ),
                        // "Send by" text positioned above the SVG
                        Positioned(
                          top: 0,
                          left: 14,
                          child: Text(
                            'Send by',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        // Center-aligned name text
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      110), // Offset for proper center alignment
                              child: Text(
                                'PRASAD',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: 'Jost',
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Time aligned to the far right
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'PM',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFC00631),
                                fontFamily: 'Jost',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Second section with SVG
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0), // Horizontal padding for spacing
                    child: Stack(
                      clipBehavior:
                          Clip.none, // Allow the stack to overflow if needed
                      children: [
                        // Row with SVG (this needs to be behind)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/round_red_long.svg', // Replace with your SVG asset path
                              width: 72,
                              height: 20, // Adjust the size of the SVG
                            ),
                          ],
                        ),
                        // Text positioned above the SVG
                        Positioned(
                          top: 0, // Adjust the vertical position of the text
                          left: 9, // Minor adjustment to center above SVG
                          child: Text(
                            'Updated by', // Change this text as per your need
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12, // Adjust text size
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        // New text at the center of the row
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 110), // Offset for centering
                              child: Text(
                                'RAHUL',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: 'Jost',
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Time aligned to the far right
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'PM',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFC00631),
                                fontFamily: 'Jost',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Third section with SVG
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0), // Horizontal padding for spacing
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Row with SVG (background)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/round_red_long.svg', // Replace with your SVG asset path
                              width: 72,
                              height: 20,
                            ),
                          ],
                        ),
                        // "Accepted by" positioned over the SVG
                        Positioned(
                          top: 0,
                          left: 9,
                          child: Text(
                            'Accepted by',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        // "YOU" in the middle, slightly left-aligned
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      110), // Padding to push "YOU" to the center area
                              child: Text(
                                'YOU',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: 'Jost',
                                ),
                              ),
                            ),
                          ),
                        ),
                        // "4:30 PM" at the far right
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'PM',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFC00631),
                                fontFamily: 'Jost',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}

class CommonStatCard extends StatelessWidget {
  final String value;
  final String label;
  final String assetPath;
  final double topValuePosition;
  final double topLabelPosition;

  const CommonStatCard({
    Key? key,
    required this.value,
    required this.label,
    required this.assetPath,
    this.topValuePosition = 6,
    this.topLabelPosition = 54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 131,
          height: 98,
          decoration: BoxDecoration(
            color: const Color(0xFF0E181B),
            border: Border.all(color: const Color(0xFFC5D1D8)),
          ),
        ),
        Positioned(
          bottom: -8,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            assetPath,
            height: 24,
            width: 24,
            alignment: Alignment.center,
          ),
        ),
        Positioned(
          top: topValuePosition,
          left: 20,
          right: 0,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: topLabelPosition,
          left: 10,
          right: 65,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFC5D1D8),
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
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

// CustomPainter to draw a gradient color border along the hexagonal bottom corners
class HexagonalBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create the gradient
    final gradient = LinearGradient(
      colors: [
        Color(0x00000000), // 0% transparent black
        Color(0xFFBB0130), // 100% #BB0130
        Color(0xFFBB0130), // 100% #BB0130
        Color(0xFFBB0130), // 100% #BB0130
        Color(0xFFBB0130), // 100% #BB0130
        Color(0xFFBB0130), // 100% #BB0130
        Color(0x00000000), // 0% transparent black
      ],
      begin: Alignment.topLeft, // Gradient start point from left
      end: Alignment.topRight, // Gradient end point to right
    );

    // Apply the gradient to the paint shader
    Paint paint = Paint()
      ..shader = gradient
          .createShader(Rect.fromLTWH(0, size.height - 40, size.width, 40))
      ..strokeWidth = 2 // Adjust the thickness of the line
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
