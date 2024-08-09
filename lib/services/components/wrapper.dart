import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mangafeed/pages/screens/nav_bar.dart'; // Make sure Home is defined here
import 'package:mangafeed/pages/sign_in/signin.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else {
            if (snapshot.data == null) {
              return const Signin();
            } else {
              return const Home(); // Make sure Home is defined and imported
            }
          }
        },
      ),
    );
  }
}
