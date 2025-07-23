import 'package:flutter/material.dart';
import 'screens/auth/login.dart';
import 'screens/auth/signup.dart';
import 'screens/auth/forgot_password.dart';
import 'screens/auth/reset_password.dart';
import 'screens/auth/otp_screen.dart';
import 'screens/auth/verification_success.dart';
import 'screens/home/home.dart';

class AvaristaApp extends StatelessWidget {
  const AvaristaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avarista Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black87),
          bodySmall: TextStyle(color: Colors.black54),
          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 16),
          titleSmall: TextStyle(fontSize: 14),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/reset-password': (context) => ResetPasswordScreen(),
        '/otp': (context) => OTPVerificationScreen(),
        '/verification_success': (context) => VerificationSuccessScreen(),
        '/fashion_home': (context) => FashionShoppingScreen(),
      },
    );
  }
}
