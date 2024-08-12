import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  final _formKey = GlobalKey<FormState>();

  String? errorMessage = '';

  final _fullname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _fullname.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    FocusScope.of(context).unfocus();
    if (_password.text != _confirmPassword.text) {
      // This validation error is handled within the form validation
      setState(() {
        errorMessage = 'Passwords do not match';
      });
      return;
    }

    try {
      await AuthService().createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      AuthService().signOut();
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showErrorDialog(
          'The email address is already in use by another account.',
          'Email Already In Use',
        );
      } else {
       
        setState(() {
          errorMessage = e.message;
        });
        _showErrorDialog(e.message ?? 'An error occurred', 'Error');
      }
    } catch (e) {
      print('Exception: $e');
      setState(() {
        errorMessage = 'An unexpected error occurred';
      });
      _showErrorDialog('An unexpected error occurred', 'Error');
    }
  }

  void _showErrorDialog(String message, String error, {VoidCallback? onOk}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(error),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (onOk != null) {
                onOk(); // Call the callback if provided
              }
            },
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  MyTextField(
                    textLabel: 'Fullname',
                    controller: _fullname,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
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
                    textLabel: 'Password',
                    controller: _password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  MyTextFieldPass(
                    textLabel: 'Confirm Password',
                    controller: _confirmPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _password.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.h),
                  MyButton(
                    textButton: 'Sign Up',
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        try {
                          await createUserWithEmailAndPassword(
                            email: _email.text,
                            password: _password.text,
                          );
                          // Show success dialog and navigate after pressing OK
                          _showErrorDialog(
                            'User Created Successfully',
                            'Success',
                            onOk: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Signin(),
                                ),
                              );
                            },
                          );
                        } catch (e) {
                          log('Error: $e');
                        }
                      } else {
                        log('Form is not valid');
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Or sign in with',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: "Poppins",
                      color: textSubtitle,
                    ),
                  ),
                  SizedBox(height: 30.h),
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
                          color: textSubtitle,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signin(),
                          ),
                        ),
                        child: Text(
                          'Sign In',
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
            ),
          ),
        ),
      ),
    );
  }
}
