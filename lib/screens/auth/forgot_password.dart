import 'package:flutter/material.dart';
import 'package:avarista/widgets/BackgroundWallpaper.dart';
import 'package:avarista/widgets/form_input.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWallpaper(
        child: Column(
          children: [
            SizedBox(height: 300),
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
                  children: [
                    Text("Forgot password?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Don’t worry! It’s happens. Please " ,style: TextStyle(fontSize: 16)),
                    Text("enter the email address associated",style: TextStyle(fontSize: 16)),
                    Text("with your account.",style: TextStyle(fontSize: 16)),
                    SizedBox(height: 30),
                    FormInput(hint: 'Email Address or Phone Number'),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA6192E),
                        minimumSize: Size.fromHeight(45),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/reset-password');
                      },
                      child: Text("Submit",style: TextStyle(fontSize: 18, color: Colors.white,)),
                    ),
                    SizedBox(height: 30),

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
