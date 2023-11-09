import '../utils/AddImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:todolist/Auth/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todolist/utils/imagepicker.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: prefer_const_constructors, unused_local_variable

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _images;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _images = img;
    });
  }

  void saveImage() async {
    String resp = await AddImage().saveImage(file: _images!);
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
        actions: [
          IconButton(
              onPressed: authService.handleSignOut, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                _images != null
                    ? CircleAvatar(
                        radius: 65,
                        backgroundImage: MemoryImage(_images!),
                      )
                    : CircleAvatar(
                        radius: 65,
                      ),
                Positioned(
                  child: IconButton(
                      onPressed: () => selectImage(),
                      icon: Icon(Icons.add_a_photo)),
                  bottom: -10,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 100,
              child: Text(FirebaseAuth.instance.currentUser!.email.toString()),
            ),
            ElevatedButton(
                onPressed: () => saveImage(), child: Text("Save image"))
          ],
        ),
      ),
    );
  }
}
