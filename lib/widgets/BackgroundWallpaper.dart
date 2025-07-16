import 'package:flutter/material.dart';

class BackgroundWallpaper extends StatelessWidget {
  final Widget child;

  const BackgroundWallpaper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Red gradient background
        Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFA6192E), Color(0xFFA6191F)],
            ),
          ),
        ),
        // White bottom background
        Positioned(
          top: MediaQuery.of(context).size.height / 2,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(color: Colors.white),
        ),

        // Bubble Decorations (optional - same as yours)
        ..._buildBubbles(),

        // Child content
        child,
      ],
    );
  }

  List<Widget> _buildBubbles() {
    return [
      Positioned(top: -50, left: -50, child: _circle(120, 0.1)),
      Positioned(top: 20, right: -30, child: _circle(80, 0.08)),
      Positioned(top: 100, left: 50, child: _circle(30, 0.12)),
      Positioned(top: 80, right: 80, child: _circle(20, 0.1)),
      Positioned(top: 160, left: 20, child: _circle(40, 0.08)),
      Positioned(top: 140, right: 40, child: _circle(25, 0.1)),
      Positioned(top: 220, left: 80, child: _circle(15, 0.12)),
      Positioned(top: 200, right: 100, child: _circle(35, 0.08)),
    ];
  }

  Widget _circle(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }
}
