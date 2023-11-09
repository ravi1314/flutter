import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:todolist/pages/testing.dart';
import 'package:todolist/pages/LoginPage.dart';
import 'package:todolist/Auth/authService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore_for_file: unused_element

// ignore_for_file: unused_import

// ignore_for_file: prefer_const_constructors

//call google api for sign in

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AurhPage(),
    );
  }
}
