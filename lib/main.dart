import 'package:award/Frames/award_frame.dart';
import 'package:award/Frames/award_page.dart';
import 'package:award/Pages/allocated_award.dart';
import 'package:award/Pages/create_award.dart';
import 'package:award/Pages/tournament_page.dart';
import 'package:award/Pages/update_award.dart';
import 'package:award/Frames/hexagoan_page.dart';
import 'package:award/PopUp/add_members.dart';
import 'package:award/PopUp/add_members_dialog.dart';
import 'package:award/PopUp/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AddMembersController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: CreateAward(),
    );
  }
}
