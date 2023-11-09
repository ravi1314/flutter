import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newtodolist/pages/HomePage.dart';
// ignore_for_file: unused_local_variable, unnecessary_import

// ignore_for_file: prefer_const_constructors

void main() async {
  await Hive.initFlutter();

  //open box

  var box = await Hive.openBox('Mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
////////////////////////////////////////////////////////////////////////////*************************************************//////////////// */