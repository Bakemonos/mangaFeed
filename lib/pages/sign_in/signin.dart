import 'package:flutter/material.dart';
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
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      width: 186.w,
                      'assets/Logos/mangaLogo.svg',
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login to your Account',
                      style: TextStyle(
                          color: textSubtitle,
                          fontSize: 18.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  MyTextField(
                    textLabel: 'Email',
                    controller: _email,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextFieldPass(
                    textLabel: 'Password',
                    controller: _password,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  MyButton(
                    textButton: 'Sign In',
                    onPressed: () {
                      _signUp();
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
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
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: "Poppins",
                            color: textSubtitle),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signup(),
                          ),
                        ),
                        child: Text('Sign Up',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: "Poppins",
                                color: primarColor)),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      _showDialog(
        'Success',
        'User Logged Succesfuly',
        () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        },
      );
    }
  }

  void _showDialog(String title, String message, Function() onPressed,
      {bool navigateToSignin = false}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _signUp() {
    _auth.createUserWithEmailAndPassword(_email.text, _password.text);
  }
}
