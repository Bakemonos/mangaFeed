import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mangafeed/components/button.dart';
import 'package:mangafeed/components/supportOption.dart';
import 'package:mangafeed/components/textField.dart';
import 'package:mangafeed/components/textField_pass.dart';
import 'package:mangafeed/pages/screens/nav_bar.dart';
import 'package:mangafeed/pages/sign_up/signup.dart';
import 'package:mangafeed/properties.dart';
import 'package:mangafeed/services/auth.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>(); // Add this line
  String? errorMessage;
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> signInWithEmailAndPassword() async {
    FocusScope.of(context).unfocus();

    // Check if the form is valid
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await AuthService().signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          errorMessage = 'Invalid email or password. Please try again.';
        });
        _showErrorDialog(errorMessage!, 'Error');
      } on PlatformException catch (e) {
        setState(() {
          errorMessage =
              e.message ?? 'An unexpected error occurred. Please try again.';
        });
        _showErrorDialog(errorMessage!, 'Error');
      } catch (e) {
        setState(() {
          errorMessage = 'An unexpected error occurred. Please try again.';
        });
        _showErrorDialog(errorMessage!, 'Error');
      }
    }
  }

  void _showErrorDialog(String message, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(error),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
          child: Form(
            // Wrap with Form widget
            key: _formKey, // Set the form key
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
                        'Login to your Account',
                        style: TextStyle(
                          color: textSubtitle,
                          fontSize: 18.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    MyTextField(
                      textLabel: 'Email',
                      controller: _email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                        if (!regex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    MyTextFieldPass(
                      textLabel: 'Confirm Password',
                      controller: _password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value.length <= 6) {
                          return 'Password must be at least 6 characters long.';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 30.h),
                    MyButton(
                      textButton: 'Sign In',
                      onPressed: () {
                        signInWithEmailAndPassword();
                      },
                    ),
                    SizedBox(height: 50.h),
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
                      icon3: 'twitterIcon.svg',
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account? ',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: "Poppins",
                            color: textSubtitle,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signup(),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: "Poppins",
                              color: primarColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
