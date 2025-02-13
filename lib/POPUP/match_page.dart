import 'package:award/POPUP/app_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// Dummy model for User
class User {
  final String role;
  final String dp;

  User({required this.role, required this.dp});
}

// Dummy controller for ParticipantController
class ParticipantController extends GetxController {
  var participatedUsers = <User>[].obs;

  void removeParticipant(User user) {
    participatedUsers.remove(user);
  }
}

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final ParticipantController controller = Get.put(ParticipantController());

  List<User> participants = [
    User(role: 'Organizer', dp: 'assets/profile.svg'),
    User(role: 'Sponsor', dp: 'assets/profile.svg'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Trigger rebuild when the tab index changes
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    List<User> organizers =
    participants.where((user) => user.role == 'Organizer').toList();
    List<User> sponsors =
    participants.where((user) => user.role == 'Sponsor').toList();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 36),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        child: AppDialogBox(
          title: 'Add Members',
          boxHeight: screenHeight * 0.78,
          isButton: true,
          onTab: () {},
          buttonTitle: 'CANCEL',
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  labelPadding: const EdgeInsets.only(left: 0, right: 30),
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  tabs: [
                    _buildTabLabel('Organizer', organizers.length, 0),
                    _buildTabLabel('Sponsor', sponsors.length, 1),
                  ],
                ),
                const SizedBox(height: 12),
                const SizedBox(height: 5),
                SizedBox(
                  height: screenHeight * 0.45,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildUserList(organizers),
                      _buildUserList(sponsors),
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: screenHeight * .07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Obx(() {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.participatedUsers.length,
                            itemBuilder: (context, idx) {
                              return Padding(
                                padding:
                                const EdgeInsets.only(right: 8.0),
                                child: _buildBottomImageBox(
                                    controller.participatedUsers[idx]),
                              );
                            },
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Obx(() {
                          return Text(
                            '+${controller.participatedUsers.length}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xffDEDEDE),
                              letterSpacing: 1.26,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabLabel(String title, int count, int index) {
    bool isActive = _tabController.index == index;

    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isActive ? 18 : 14,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              letterSpacing: isActive ? .36 : 1.4,
              color: isActive ? Colors.white : Colors.grey,
            ),
          ),
          const SizedBox(width: 6),
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/trapezium.svg',
                height: 26,
                width: 26,
              ),
              Positioned(
                top: 3,
                left: 0,
                bottom: 10,
                right: 0,
                child: Text(
                  count.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserList(List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, idx) {
        return ListTile(
          title: Text(users[idx].role),
        );
      },
    );
  }

  Widget _buildBottomImageBox(User user) {
    return Stack(
      children: [
        SvgPicture.asset('assets/profile.svg'),
        Positioned(
          top: 4,
          left: 45,
          child: InkWell(
            onTap: () {
              controller.removeParticipant(user);
            },
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                gradient: LinearGradient(
                  colors: [
                    Color(0xffDE2234),
                    Color(0xffBB0130),
                  ],
                ),
              ),
              child: const Icon(
                Icons.close,
                size: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}
