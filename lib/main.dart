import 'package:award/Frames/award_frame.dart';
import 'package:award/Frames/award_page.dart';
import 'package:award/POPUP/match_page.dart';
import 'package:award/Pages/allocated_award.dart';
import 'package:award/Pages/create_award.dart';
import 'package:award/Pages/tournament_page.dart';
import 'package:award/Pages/update_award.dart';
import 'package:award/Frames/hexagoan_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateAward(),
    );
  }
}
