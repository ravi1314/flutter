import 'package:hive/hive.dart';
// ignore_for_file: non_constant_identifier_names, unused_field

class ToDoDatabase {
  List TodoList = [];
  final _myBox = Hive.openBox('Mybox');
}
