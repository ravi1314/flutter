import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: file_names, prefer_const_constructors, prefer_typing_uninitialized_variables, sized_box_for_whitespace

class NewTask extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onDelete;

  NewTask(
      {super.key,
      this.controller,
      required this.onDelete,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter new Task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: onSave,
                  child: Text("Save"),
                ),
                MaterialButton(
                  onPressed: onDelete,
                  child: Text("Delete"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
