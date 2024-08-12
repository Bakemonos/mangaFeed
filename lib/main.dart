import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mangafeed/services/components/wrapper.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: 'AIzaSyDwYNlIoZuXkdTG2vuNmjzQXrqnAtYVd0c',
          appId: '1:756752798511:android:54446b6eddac3703ccc7da',
          messagingSenderId: '756752798511',
          projectId: 'mangafeed-a7bea',
        ))
      : await Firebase.initializeApp();

  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 800),
      child: MaterialApp(
        locale: Locale('en', 'PH'),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
