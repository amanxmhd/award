import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const DialogButton({
    super.key,
    required this.onPress,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        elevation: 1,
        shadowColor: Colors.red,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Container(
        width: screenWidth,
        constraints: const BoxConstraints(minHeight: 42), // Ensure fixed height
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0xffc5d1d8), width: 1.4),
        ),
        child: Container(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: const Color(0xffde2234),
            border: Border.all(
              color: const Color(0xff090909),
              width: 3, // This remains unchanged
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center, // Ensure text is always centered
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: (18 * 8) / 100,
                fontWeight: FontWeight.w600,
                fontFamily: 'Brink'),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
