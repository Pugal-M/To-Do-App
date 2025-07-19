// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTail extends StatelessWidget {
  
  final String task;
  final bool taskstatus;
  Function(bool?)?onChanged;

  Function(BuildContext)?deleteFunction;

  ToDoTail({
    super.key,
    required this.task,
    required this.taskstatus,
    required this.onChanged,
    required this.deleteFunction
    });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right:20,left: 20 ),
      child: Slidable(
        endActionPane:ActionPane(motion: const StretchMotion(),
         children: [SlidableAction(onPressed: deleteFunction,
         icon: Icons.delete,
         backgroundColor: Colors.redAccent,
         borderRadius: BorderRadius.circular(12),
         )]) ,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(value: taskstatus, onChanged: onChanged,activeColor: Colors.black,),
              Text(task,style:TextStyle(decoration: taskstatus?TextDecoration.lineThrough:TextDecoration.none),),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}