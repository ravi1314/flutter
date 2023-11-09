import 'package:flutter/material.dart';
// ignore_for_file: unused_import, prefer_const_constructors, prefer_typing_uninitialized_variables

class MyTextFiled extends StatelessWidget {
  final controller;
  final String hintText;
  const MyTextFiled({
    super.key,
    this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: hintText,
        ),
      ),
    );
  }
}
