import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore_for_file: unused_import

// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

// ignore_for_file: non_constant_identifier_names
//only image selected

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? file = await _imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
  print("Not image selected");
}
