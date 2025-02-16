import 'package:award/PopUp/add_members.dart';
import 'package:award/PopUp/add_members_page.dart';
import 'package:award/PopUp/app_dialog.dart';
import 'package:award/PopUp/check_box_clipper.dart';
import 'package:award/PopUp/search_bar.dart';
import 'package:award/PopUp/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'buttons.dart';

class AddMembersDialog extends StatefulWidget {
  const AddMembersDialog({super.key});

  @override
  _AddMembersDialogState createState() => _AddMembersDialogState();
}

class _AddMembersDialogState extends State<AddMembersDialog>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AddMembersController controller = Get.find();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Trigger rebuild when the tab index changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Filter members into organizers and sponsors
    List<User> organizers =
        members.where((user) => user.role == 'Organizer').toList();
    List<User> sponsors =
        members.where((user) => user.role == 'Sponsor').toList();

    return SafeArea(
      child: Center(
        child: AppDialogBox(
          isButton: true,
          boxWidth: screenWidth * 0.9,
          title: 'ADD MEMBERS',
          boxHeight: screenHeight * 0.73,
          contentHeight: screenHeight * 0.7,
          content: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchBarWidget(),
                const SizedBox(height: 5),

                // Custom TabBar with Red Underline
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    labelPadding: const EdgeInsets.only(left: 25, right: 30),
                    indicator: CustomTabIndicator(),
                    tabs: [
                      _buildTabLabel('Organizer', organizers.length, 0),
                      _buildTabLabel('Sponsor', sponsors.length, 1),
                    ],
                  ),
                ),

                // TabBarView to show respective lists
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildUserList(organizers),
                      _buildUserList(sponsors),
                    ],
                  ),
                ),
                const SizedBox(height: 2),

                // Confirm Button
                DialogButton(
                  title: 'CONFIRM',
                  onPress: () {
                    controller.confirmSelections();
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom Tab Label with Badge (Dynamically Styles Active Tab)
  Widget _buildTabLabel(String title, int count, int index) {
    bool isActive = _tabController.index == index; // Track active tab
    double size =
        isActive ? 26 : 18; // Adjust size based on active/inactive state

    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isActive ? 16 : 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              letterSpacing: isActive ? .36 : 1.4,
              color: isActive ? Colors.white : Colors.grey,
            ),
          ),
          const SizedBox(width: 6),
          // Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     SvgPicture.asset(
          //       'assets/trapezium.svg', // Your trapezium SVG
          //       height: size, // Dynamically change size
          //       width: size, // Dynamically change size
          //     ),
          //     Positioned(
          //       top: 2,
          //       child: Text(
          //         count.toString().padLeft(2, '0'), // Format as '05'
          //         style: TextStyle(
          //           fontSize: isActive ? 13 : 8, // Adjust text size as well
          //           fontWeight: FontWeight.normal,
          //           color: Colors.white,
          //         ),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ],
          // ),
          ClipPath(
            clipper: CheckboxClipper(),
            child: Container(
              // margin: EdgeInsets.only(
              //   right: 2.w,
              // ),
              padding: isActive
                  ? const EdgeInsets.only(
                      left: 6,
                      right: 6,
                      bottom: 7,
                      top: 3,
                    )
                  : const EdgeInsets.only(
                      left: 4,
                      right: 4,
                      bottom: 5,
                      top: 2,
                    ),
              decoration: BoxDecoration(
                color: Color(0xffC80D31),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                count.toString().padLeft(2, '0'),
                style: TextStyle(
                  fontSize: isActive ? 13 : 6,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to create a ListView for users
  Widget _buildUserList(List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, idx) {
        return AddMembers(user: users[idx]);
      },
    );
  }
}

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CustomPainter1();
  }
}

class CustomPainter1 extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final double width = configuration.size!.width + 15;

    final double shiftLeft = -10; // Move indicator 10 pixels to the left

    final double height = 4; // Reduced height for a sleek look

    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.red.shade700, Colors.red.shade400],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(offset.dx, offset.dy, width, height))
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(offset.dx + shiftLeft, offset.dy + configuration.size!.height)
      ..lineTo(
          offset.dx + width + shiftLeft, offset.dy + configuration.size!.height)
      ..lineTo(offset.dx + width - 6 + shiftLeft,
          offset.dy + configuration.size!.height - height)
      ..lineTo(offset.dx + 5 + shiftLeft,
          offset.dy + configuration.size!.height - height)
      ..close();

    canvas.drawPath(path, paint);
  }
}
