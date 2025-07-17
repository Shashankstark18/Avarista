import 'package:flutter/material.dart';
import 'package:avarista/widgets/BackgroundWallpaper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _obscurePassword = true;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWallpaper(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  // Illustration image
                  SizedBox(height: 50),
                  Image.asset(
                    'lib/screens/auth/girl_bag.png',
                    width: 190,
                    height: 190,
                    fit: BoxFit.contain,
                  ),

                  Transform.translate(
                    offset: Offset(0, -40),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Login title
                          Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),

                          SizedBox(height: 4),

                          // Welcome text
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'Welcome Avarista',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Please enter your details',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF999999),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 25),

                          // Phone/Email field
                          TextField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              hintText: 'Phone Number or Email',
                              hintStyle: TextStyle(
                                color: Color(0xFFBBBBBB),
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFE0E0E0),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFE0E0E0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFB71C1C),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 15,
                              ),
                            ),
                          ),

                          SizedBox(height: 25),

                          // Password field
                          TextField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Color(0xFFBBBBBB),
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFE0E0E0),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFE0E0E0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFB71C1C),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 15,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(0xFFBBBBBB),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                          ),

                          SizedBox(height: 15),

                          // Remember me checkbox
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                                activeColor: Color(0xFFA6192E)
                                ,
                              ),
                              Text(
                                'Remember information',
                                style: TextStyle(
                                  color: Color(0xFF0C0C0C),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 15),

                          // Login button
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle login
                                Navigator.pushNamed(context, '/otp');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFB71C1C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 25),

                          // Forgot password
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/forgot-password');
                                // Handle forgot password
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: Color(0xFF2196F3),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 15),

                          // Or divider
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Color(0xFFE0E0E0),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'or',
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Color(0xFFE0E0E0),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 15),

                          // Social login buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Google
                              Container(
                                width: 85,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Color(0xFFE0E0E0)),
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                      'lib/assets/icons/google.png'),
                                  onPressed: () {
                                    // Handle Google login
                                  },
                                ),
                              ),

                              // Facebook
                              Container(
                                width: 85,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Color(0xFFE0E0E0)),
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                      'lib/assets/icons/facebook.png'),
                                  onPressed: () {
                                    // Handle Facebook login
                                  },
                                ),
                              ),

                              // Apple
                              Container(
                                width: 85,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Color(0xFFE0E0E0)),
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                      'lib/assets/icons/apple.png'),
                                  onPressed: () {
                                    // Handle Apple login
                                  },
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'First time here? ',
                          style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle sign up
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(
                            'Sign up for free',
                            style: TextStyle(
                              color: Color(0xFF2196F3),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
