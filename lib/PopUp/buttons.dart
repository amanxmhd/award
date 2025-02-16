import 'package:flutter/material.dart';

class ExitButtons extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;
  const ExitButtons({super.key, required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return IconButton(
      onPressed: onPress,
      icon: Container(
          alignment: Alignment.center,
          height: screenHeight * 0.04,
          width: screenHeight * 0.04,
          padding: EdgeInsets.all(screenHeight * 0.006),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0D1314), Color(0xFF203237)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF273133)
                      .withOpacity(0.8), // Color for the glow
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
              ],
              border: Border.all(color: const Color(0xff4a5c60), width: 0.5),
              borderRadius: BorderRadius.circular(100)),
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFDE2234), Color(0xFF8F0023)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Icon(
              icon,
              color:
                  Colors.white, // This color will be replaced by the gradient
              size: screenHeight * 0.018,
            ),
          )),
    );
  }
}

class ChangingButtons extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color titleColor;
  final VoidCallback onPress;

  const ChangingButtons({
    super.key,
    // required this.text,
    // this.color = const Color(0xffde2234),
    required this.onPress,
    required this.title,
    required this.buttonColor,
    required this.titleColor,
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
        width: 85,
        height: 40,
        //padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0xffc5d1d8), width: 1.4),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
              color: buttonColor, //const Color(0xffde2234),
              border: Border.all(
                color: const Color(0xff090909),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4)),
          child: Text(
            title,
            style: TextStyle(
                color: titleColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.84
                //fontFamily: 'Jost',
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class RemoveButton extends StatelessWidget {
  final VoidCallback onPress;

  const RemoveButton({
    super.key,
    required this.onPress,
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
        width: 85,
        height: 40,
        //padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0xffc5d1d8), width: 1.4),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
              color: const Color(0xffC7C7C7),
              border: Border.all(
                color: const Color(0xff090909),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4)),
          child: Text(
            "REMOVE",
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.84
                //fontFamily: 'Jost',
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  final VoidCallback onPress;

  const CancelButton({
    super.key,
    required this.onPress,
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
        width: 85,
        height: 40,
        //padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0xffc5d1d8), width: 1.4),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
              color: const Color(0xffC7C7C7),
              border: Border.all(
                color: const Color(0xff090909),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4)),
          child: Text(
            "CANCEL",
            style: TextStyle(
                color: Colors.black,
                fontSize: screenHeight * 0.014,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.84
                //fontFamily: 'Jost',
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

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
