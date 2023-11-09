import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:newtodolist/data/databas.dart';
import 'package:newtodolist/utils/NewTask.dart';
import 'package:newtodolist/utils/myTodoBox.dart';
// ignore_for_file: unused_field

// ignore_for_file: non_constant_identifier_names

// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  final _myBox = Hive.openBox('Mybox');
  ToDoDatabase db = ToDoDatabase();
  final _controller = TextEditingController();

  //checkBox chang or not
  void checkBoxChang(bool? value, int index) {
    setState(() {
      db.TodoList[index][1] = !db.TodoList[index][1];
    });

    //is new task save then dialog box don`t show
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.TodoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //Floating action button
  void showDialogBox() {
    showDialog(
        context: context,
        builder: (context) => NewTask(
            controller: _controller,
            onDelete: () => Navigator.pop(context),
            onSave: saveNewTask));
  }
  //delete task

  void deleteTask(int index) {
    setState(() {
      db.TodoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("T o D o L i s T"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showDialogBox,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.TodoList.length,
          itemBuilder: (context, index) {
            return ToDoBox(
              taskCompleat: db.TodoList[index][1],
              taskName: db.TodoList[index][0],
              onChanged: (value) => checkBoxChang(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
