import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mangafeed/components/button.dart';
import 'package:mangafeed/components/supportOption.dart';
import 'package:mangafeed/components/textField.dart';
import 'package:mangafeed/components/textField_pass.dart';
import 'package:mangafeed/pages/sign_in/signin.dart';
import 'package:mangafeed/properties.dart';
import 'package:mangafeed/services/auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth = AuthService();
  final _fullname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fullname.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
  }

  bool passwordVisible = true;
  bool confirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 80.h),
                  Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      width: 186.w,
                      'assets/Logos/mangaLogo.svg',
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create your Account',
                      style: TextStyle(
                          color: textSubtitle,
                          fontSize: 18.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  MyTextField(
                    textLabel: 'Fullname',
                    controller: _fullname,
                  ),
                  SizedBox(height: 20.h),
                  MyTextField(
                    textLabel: 'Email',
                    controller: _email,
                  ),
                  SizedBox(height: 20.h),
                  MyTextFieldPass(
                    textLabel: 'Password',
                    controller: _password,
                  ),
                  SizedBox(height: 20.h),
                  MyTextFieldPass(
                    textLabel: 'Confirm Password',
                    controller: _confirmPassword,
                  ),
                  SizedBox(height: 30.h),
                  MyButton(
                      textButton: 'Sign Up',
                      onPressed: () {
                        _signUp();
                      }),
                  SizedBox(height: 20.h),
                  Text(
                    'Or sign in with',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: "Poppins",
                      color: textSubtitle,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const MySupportOption(
                      icon1: 'googleIcon.svg',
                      icon2: 'facebookIcon.svg',
                      icon3: 'twitterIcon.svg'),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: "Poppins",
                            color: textSubtitle),
                      ),
                      SizedBox(width: 5.w),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signin())),
                        child: Text('Sign In',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: "Poppins",
                                color: primarColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    final email = _email.text.trim();
    final password = _password.text.trim();
    final confirmPassword = _confirmPassword.text.trim();

    // Basic validation
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showDialog("Validation Error", "Please fill in all fields.");
      return;
    }

    // Email format validation
    if (!_isValidEmail(email)) {
      _showDialog("Validation Error", "Invalid email format.");
      return;
    }

    if (password != confirmPassword) {
      _showDialog("Validation Error", "Passwords do not match.");
      return;
    }

    // Optionally, validate password strength here
    if (password.length < 6) {
      _showDialog("Validation Error", "Password too short.");
      return;
    }

    try {
      final user = await _auth.createUserWithEmailAndPassword(email, password);
      if (user != null) {
        _showDialog("Success", "User Created Successfully",
            navigateToSignin: true);
      } else {
        _showDialog("Error", "User Creation Unsuccessful");
      }
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        _showDialog(
            "Error", "The email address is already in use by another account.");
      } else {
        _showDialog("Error", "Error: ${e.message}");
      }
    } catch (e) {
      // Handle other errors
      _showDialog("Error", "Error: ${e.toString()}");
    }
  }

  bool _isValidEmail(String email) {
    // Regex pattern for basic email validation
    final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return regex.hasMatch(email);
  }

  void _showDialog(String title, String message,
      {bool navigateToSignin = false}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                if (navigateToSignin) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Signin()),
                  );
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
