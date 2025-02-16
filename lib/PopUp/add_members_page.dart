import 'package:award/PopUp/add_members.dart';
import 'package:award/PopUp/buttons.dart';
import 'package:award/PopUp/individual_frame.dart';
import 'package:award/PopUp/name_field.dart';
import 'package:award/PopUp/person_frame.dart';
import 'package:award/PopUp/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMembers extends StatelessWidget {
  final User user;
  const AddMembers({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final AddMembersController controller = Get.find();

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 75,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const IndividualFrame(width: 60, height: 64, imageUrl: ''),
              SizedBox(width: 8),

              // PersonFrame(
              //   dp: user.dp,
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NameFields(
                      name: user.name,
                      id: user.userId,
                      isAdded: controller.isUserAdded(user),
                    ),
                    // Obx(
                    //   () {
                    //     bool isAdded = controller.isUserAdded(user);
                    //     bool isTemp = controller.isUserInTemp(user);

                    //     return AnimatedSwitcher(
                    //       duration: const Duration(milliseconds: 300),
                    //       transitionBuilder: (child, animation) {
                    //         return ScaleTransition(
                    //             scale: animation, child: child);
                    //       },
                    //       child: isAdded
                    //           ? RemoveButton(
                    //               key: ValueKey('remove_${user.userId}'),
                    //               onPress: () async {
                    //                 await Get.to(
                    //                   () => RemoveUserPage(user: user),
                    //                   transition: Transition.rightToLeft,
                    //                 );
                    //               },
                    //             )
                    //           : isTemp
                    //               ? CancelButton(
                    //                   key: ValueKey('cancel_${user.userId}'),
                    //                   onPress: () =>
                    //                       controller.removeFromTemp(user),
                    //                 )
                    //               : AddButton(
                    //                   key: ValueKey('add_${user.userId}'),
                    //                   onPress: () => controller.addToTemp(user),
                    //                 ),
                    //     );
                    //   },
                    // ),
                    Obx(
                      () {
                        bool isAdded = controller.isUserAdded(user);
                        bool isTemp = controller.isUserInTemp(user);

                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: isAdded
                              ? ChangingButtons(
                                  title: 'REMOVE',
                                  buttonColor: Color(0xffC7C7C7),
                                  titleColor: Colors.black,
                                  key: ValueKey('remove_${user.userId}'),
                                  onPress: () async {
                                    // await Get.to(
                                    //   () => RemoveUserPage(user: user),
                                    //   transition: Transition.rightToLeft,
                                    // );
                                    print('Pressed remove button');
                                  },
                                )
                              : isTemp
                                  ? ChangingButtons(
                                      title: 'CANCEL',
                                      buttonColor: Color(0xffC7C7C7),
                                      titleColor: Colors.black,
                                      key: ValueKey('cancel_${user.userId}'),
                                      onPress: () {
                                        controller.removeFromTemp(user);
                                        print(
                                            'Removed from temp: ${user.name}');
                                      },
                                    )
                                  : ChangingButtons(
                                      title: 'ADD',
                                      buttonColor: Color(0xffde2234),
                                      titleColor: Colors.white,
                                      key: ValueKey('add_${user.userId}'),
                                      onPress: () {
                                        controller.addToTemp(user);
                                        print('Added to temp: ${user.name}');
                                      },
                                    ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.0004,
          color: const Color(0xff707070),
        ),
      ],
    );
  }
}
