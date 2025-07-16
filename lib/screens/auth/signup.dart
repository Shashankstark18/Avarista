import 'package:flutter/material.dart';
import 'package:avarista/widgets/BackgroundWallpaper.dart';
import 'package:avarista/widgets/form_input.dart';
import 'package:flutter/gestures.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWallpaper(
        child: Column(
          children: [
            SizedBox(height: 140),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                    Text('Sign up', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("Hello there! Let's create your", style: TextStyle(fontSize: 20,)),
                    Text("account", style: TextStyle(fontSize: 20,)),

                    SizedBox(height: 40),
                    FormInput(hint: 'Enter Your Name'),
                    SizedBox(height: 30),
                    FormInput(hint: 'Enter Your Last Name'),
                    SizedBox(height: 30),
                  IntlPhoneField(
                decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFA6192E)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
              ),
              initialCountryCode: 'IN', // Default to India
              onChanged: (phone) {
                print(phone.completeNumber); // You get +91XXXXXXXXXX
              },
            ),
                    SizedBox(height: 30),
                    FormInput(hint: 'Email address'),
                    SizedBox(height: 30),
                    FormInput(hint: 'Password', isPassword: true),
                    SizedBox(height: 30),
              Row(
                  children: [
                  Checkbox(value: false, onChanged: (val) {}),
              Flexible(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    children: [
                      TextSpan(text: 'I agree to Platform '),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(color: Color(0xFF1B85F3), fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle Terms of Service tap
                            print('Terms of Service clicked');
                          },
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: Color(0xFF1B85F3), fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle Privacy Policy tap
                            print('Privacy Policy clicked');
                          },
                      ),
                    ],
                  ),
                ),
              ),
              ],
            ),
                    SizedBox(height: 15),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA6192E),
                        minimumSize: Size.fromHeight(45),
                      ),
                      onPressed: () {},
                      child: Text("Create account",style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Joined us before? "),
                TextButton(onPressed: (

                    ) {
                  Navigator.pushNamed(context, '/login');
                }, child: Text("Login",style: TextStyle(color: Color(0xFF1B85F3), fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );
  }
}