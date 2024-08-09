import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mangafeed/components/button.dart';
import 'package:mangafeed/pages/sign_in/signin.dart';
import 'package:mangafeed/services/auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Profile> {
  final User? user = AuthService().currentUser;

  Future<void> signOut() async {
    await AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: MyButton(
                textButton: 'Sign Out',
                onPressed: () {
                  signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Signin()));
                }),
          ),
        ],
      ),
    );
  }
}
