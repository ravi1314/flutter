import 'package:flutter/material.dart';
import 'package:todolist/pages/homePage.dart';
import 'package:todolist/pages/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: prefer_const_constructors

class AurhPage extends StatelessWidget {
  const AurhPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return LoginPage();
            }
          }),
    );
  }
}
