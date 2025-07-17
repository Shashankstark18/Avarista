// lib/screens/auth/verification_success_screen.dart

import 'package:flutter/material.dart';

class VerificationSuccessScreen extends StatelessWidget {
  const VerificationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA6192E),
      body: Stack(
        children: [
          // 🎁 Background decorative assets
          Positioned(top: 60, left: 20, child: Image.asset('lib/assets/verification_success/image1.png', width: 60)),
          Positioned(top: 40, right: 30, child: Image.asset('lib/assets/verification_success/image2.png', width: 50)),
          Positioned(bottom: 100, left: 30, child: Image.asset('lib/assets/verification_success/image3.png', width: 60)),
          Positioned(bottom: 80, right: 20, child: Image.asset('lib/assets/verification_success/image4.png', width: 40)),

          // ✅ Main success box
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 60),
                      SizedBox(height: 15),
                      Text(
                        "Welcome! You're officially verified",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Congratulations! You’re now a verified member of our community. It’s time to enjoy exclusive perks and explore the world of fashion.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to home or shopping page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA6192E),
                          minimumSize: Size.fromHeight(45),
                        ),
                        child: Text("Start Shopping", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
