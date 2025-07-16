import 'package:flutter/material.dart';
import 'package:avarista/widgets/BackgroundWallpaper.dart';
import 'package:avarista/widgets/form_input.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWallpaper(
        child: Column(
          children: [
            SizedBox(height: 250),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("Reset password", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
                    SizedBox(height: 30),
                    FormInput(hint: "New Password", isPassword: true),
                    SizedBox(height: 30),
                    Row(children: [Icon(Icons.circle, size: 10, color: Colors.grey), SizedBox(width: 5), Text("Least 8 characters")]),
                    Row(children: [Icon(Icons.check_circle, size: 10, color: Colors.green), SizedBox(width: 5), Text("At least one number or symbol")]),
                    Row(children: [Icon(Icons.check_circle, size: 10, color: Colors.green), SizedBox(width: 5), Text("Lowercase and Uppercase")]),
                    SizedBox(height: 30),
                    FormInput(hint: "Confirm new password", isPassword: true),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA6192E),
                        minimumSize: Size.fromHeight(45),
                      ),
                      onPressed: () {},
                      child: Text("Submit",style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
