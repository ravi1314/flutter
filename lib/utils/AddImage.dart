import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
//fire stor

final FirebaseStorage _storage = FirebaseStorage.instance;
// ignore: unused_element
final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class AddImage {
  Future<String> uplodImageToStoreg(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveImage({required Uint8List file}) async {
    String resp = "Some Error";
    try {
      String imgUrl = await uplodImageToStoreg('ProfileImage', file);
      await _firebaseFirestore
          .collection('userProfile')
          .add({'imageLink': imgUrl});
      resp = "succses";
    } catch (e) {
      resp = e.toString();
    }
    return resp;
  }
}
