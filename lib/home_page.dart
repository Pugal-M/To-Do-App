// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food/database/data_base.dart';
import 'package:food/util/dialog_box.dart';
import 'package:food/util/todo_tail.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//box refference
final _mybox= Hive.box("mybox");

final _controller = TextEditingController();

ToDoDataBase db=ToDoDataBase();
@override
  void initState() {
    if(_mybox.get("TODOLIST")==null){
      db.createInitialData();
    }
    else{
      db.loaddata();
    }
    super.initState();
  }
void checkBoxChanged(bool? value,int index){
setState(() {
 db. toDoList[index][1]=!db.toDoList[index][1];
});
db.updateDataBase();
}
//save new task

void saveNewTask(){
  setState(() {
   db. toDoList.add([_controller.text,false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
  db.updateDataBase();
}

//cancel task
void cancelTask(){
  _controller.clear();
  Navigator.of(context).pop();
}
//delete task
void deleteTask(int index){
setState(() {
  db.toDoList.removeAt(index);
});
db.updateDataBase();

}

// add task
void _add(){
  showDialog(context: context,
   builder:(context) {
     return DialogBox(
      controller: _controller,
      oncancel: cancelTask,
      onsave: saveNewTask ,
     );
   },
   );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.grey[700],
      title: const Center(
        child: Text("T o d a y ' s     L i s t   ",
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,
        fontFamily: AutofillHints.fullStreetAddress),),),
    ),
    

    body: ListView.builder(
      itemCount: db.toDoList.length,
      itemBuilder:(context, index) {
        return ToDoTail(
          task: db.toDoList[index][0],
          taskstatus: db.toDoList[index][1],
          onChanged: (value) => checkBoxChanged(value,index),
          deleteFunction: (context)=> deleteTask(index),
          );
      } ,
    ),

  floatingActionButton: FloatingActionButton(
    onPressed: _add,
    backgroundColor: Colors.grey[600],
    child: const Icon(Icons.add,color: Colors.white,),

    ),
    );
  }
}
