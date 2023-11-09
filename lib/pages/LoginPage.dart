import 'package:flutter/material.dart';
import 'package:todolist/Auth/auth.dart';
import 'package:todolist/pages/testing.dart';
import 'package:todolist/utils/mytextfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';
// ignore_for_file: unused_import

// ignore_for_file: sort_child_properties_last

// ignore_for_file: sized_box_for_whitespace

// ignore_for_file: must_be_immutable, unused_element, avoid_print

// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

// ignore_for_file: file_names

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  //auth
  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      body: Center(
        child: Container(
          height: 40,
          child: SignInButton(
            Buttons.google,
            text: "SignIn With Google",
            onPressed: authService.handleSignIn,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey.shade500, offset: Offset(4, 4)),
            ],
          ),
        ),
      ),
    );
  }
}
