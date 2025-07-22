import 'package:flutter/material.dart';
import 'package:avarista/widgets/BackgroundWallpaper.dart';

class VerificationSuccessScreen extends StatelessWidget {
  const VerificationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔴 Full Red Background (top + bottom)
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(color: const Color(0xFFA6192E)),
                ),
                Expanded(
                  child: Container(color: const Color(0xFFA6192E)),
                ),
              ],
            ),
          ),

          // 🎨 Optional Wallpaper Blur or Effects Layer
          const BackgroundWallpaper(child: SizedBox()),

          // 🎁 Positioned + Tilted Images
          Positioned(
            top: 40,
            left: -10,
            child: Transform.rotate(
              angle: 0.2,
              child: Image.asset(
                'lib/assets/verification_success/image1.png',
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 80,
            right: 10,
            child: Transform.rotate(
              angle: -0.1,
              child: Image.asset(
                'lib/assets/verification_success/image2.png',
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 10,
            child: Transform.rotate(
              angle: 0.4,
              child: Image.asset(
                'lib/assets/verification_success/image6.png',
                width: 180,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 350,
            right: -35,
            child: Transform.rotate(
              angle: 0.3,
              child: Image.asset(
                'lib/assets/verification_success/image4.png',
                width: 180,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 350,
            left: -50,
            child: Transform.rotate(
              angle: -0.3,
              child: Image.asset(
                'lib/assets/verification_success/image3.png',
                width: 180,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 170,
            right: 140,
            child: Transform.rotate(
              angle: 0.3,
              child: Image.asset(
                'lib/assets/verification_success/image5.png',
                width: 80,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 10,
            child: Transform.rotate(
              angle: 0.3,
              child: Image.asset(
                'lib/assets/verification_success/image7.png',
                width: 130,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // ✅ Main Card
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ✅ Green Check Icon in White Circle
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4CAF50),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ✅ Title
                    const Text(
                      "Welcome! You're officially verified",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222222),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ✅ Description
                    const Text(
                      "Congratulations! You're now a verified member of our community. It's time to enjoy exclusive perks and explore the world of fashion.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF666666),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // ✅ Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/fashion_home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFA6192E),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Start Shopping",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
