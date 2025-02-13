import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(240, 240, 240, 1),
              width: 0.1,
            ),
            borderRadius: BorderRadius.all(
              Radius.zero,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(240, 240, 240, 1),
              width: 0.1,
            ),
            borderRadius: BorderRadius.all(
              Radius.zero,
            ),
          ),
          hintText: "Search for Members",
          hintStyle: TextStyle(
              letterSpacing: .84,
              fontSize: 14,
              color: Color.fromRGBO(197, 209, 216, .8)),
        ),
      ),
    );
  }
}