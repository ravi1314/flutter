import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// ignore_for_file: prefer_const_constructors

// ignore_for_file: sized_box_for_whitespace

// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable

class AuthService {
  //firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  //Google Sign in

  signInWithGoogle() async {
    //begin intercut sign in process
  }

  Future<void> handleSignIn() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      //obtain auth detail

      if (gUser != null) {
        final GoogleSignInAuthentication gAuth = await gUser!.authentication;

        //create new user

        final credential = GoogleAuthProvider.credential(
            accessToken: gAuth.accessToken, idToken: gAuth.idToken);

        //final sign in

        await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } catch (e) {
      Container(
        height: 40,
        child: Text("error is $e"),
      );
    }
  }
  //image of user

  getProfileImage<String>() {
    if (_auth.currentUser?.photoURL != null) {
      return Image.network(
        _auth.currentUser!.photoURL!,
        height: 100,
        width: 100,
      );
    } else {
      return Icon(
        Icons.account_circle,
        size: 100,
      );
    }
  }
  //google sign out

  Future<void> handleSignOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      Container(
        height: 40,
        child: Text("error is $e"),
      );
    }
  }
}
