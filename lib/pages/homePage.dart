// ignore_for_file: avoid_unnecessary_containers

import 'dart:typed_data';
import '../utils/AddImage.dart';
import 'package:flutter/material.dart';
import 'package:todolist/Auth/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todolist/utils/imagepicker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: unused_local_variable

// ignore_for_file: must_be_immutable

// ignore_for_file: sort_child_properties_last

// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: sized_box_for_whitespace

// ignore_for_file: file_names, prefer_const_constructors

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //image selected
  final textcontroller = TextEditingController();

  void addNote() {
    showDialog(
      context: (context),
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textcontroller,
        ),
        actions: [
          Row(
            children: [
              TextButton(onPressed: () {}, child: Text("Save")),
              SizedBox(
                width: 5,
              ),
              TextButton(onPressed: () => saveNote(), child: Text("delete")),
            ],
          )
        ],
      ),
    );
  }

  List TodoList = [];

  void saveNote() {
    setState(() {
      if (textcontroller != null) {
        TodoList.add(textcontroller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(FirebaseAuth.instance.currentUser!.email.toString()),
            SizedBox(
              height: 20,
            ),
            Text(
              textcontroller.text,
              style: TextStyle(color: Colors.black),
            ),
            ListView.builder(
                itemCount: TodoList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(TodoList[index][0]),
                  );
                }),
            SizedBox(
              height: 400,
            ),
            FloatingActionButton(
              onPressed: addNote,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
