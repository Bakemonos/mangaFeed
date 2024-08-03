import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mangafeed/pages/screens/home.dart';
import 'package:mangafeed/pages/sign_up/signup.dart';
import 'package:mangafeed/properties.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100.h,
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
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextField(
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: "Poppins",
                        color: textSubtitle),
                    decoration: InputDecoration(
                      labelText: 'Username',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        borderSide: const BorderSide(color: textFieldStroke),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: textFieldStroke),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        borderSide: const BorderSide(color: primarColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                    obscureText: _obscureText,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: "Poppins",
                        color: textSubtitle),
                    decoration: InputDecoration(
                      // SHOW PAS

                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                      // SHOW PASS END
                      labelText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        borderSide: const BorderSide(color: textFieldStroke),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        borderSide: const BorderSide(color: primarColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 48.h,
                    width: screenWidth.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primarColor,
                        foregroundColor: textLight,
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Poppins",
                        ),
                        elevation: 5,
                        shadowColor: textFieldStroke,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.r), // Rounded corners
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      },
                      child: const Text(
                        'Sign In',
                      ),
                    ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 60.h,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                                color: foregroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.r))),
                            child: SvgPicture.asset(
                              'assets/Icons/google.svg',
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 60.h,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                                color: foregroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.r))),
                            child: SvgPicture.asset(
                              'assets/Icons/facebook.svg',
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 60.h,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                                color: foregroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.r))),
                            child: SvgPicture.asset(
                              'assets/Icons/twitter.svg',
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                                builder: (context) => const Signup())),
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
}
