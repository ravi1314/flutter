import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// ignore_for_file: prefer_const_constructors_in_immutables

// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore: must_be_immutable
class ToDoBox extends StatelessWidget {
  final String taskName;
  final bool taskCompleat;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoBox(
      {super.key,
      required this.taskCompleat,
      required this.taskName,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          height: 70,
          width: 500,
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Checkbox(value: taskCompleat, onChanged: onChanged),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleat
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
