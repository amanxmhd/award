import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileWithRedCross extends StatefulWidget {
  final VoidCallback onPressed;

  const ProfileWithRedCross({Key? key, required this.onPressed})
      : super(key: key);

  @override
  State<ProfileWithRedCross> createState() => _ProfileWithRedCrossState();
}

class _ProfileWithRedCrossState extends State<ProfileWithRedCross>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  bool _isFading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
          seconds: 1), // 1 second duration for the fade-out effect
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onRedCrossPressed() {
    if (!_isFading) {
      setState(() {
        _isFading = true;
      });
      _controller.forward();
      Future.delayed(const Duration(milliseconds: 300), () {
        widget.onPressed();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/profile_frame.svg',
            height: 80,
            width: 80,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: _onRedCrossPressed,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(3.0),
                child: SvgPicture.asset(
                  'assets/red_cross.svg',
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
