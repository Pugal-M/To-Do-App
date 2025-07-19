import 'package:hive/hive.dart';

class ToDoDataBase{
  List toDoList=[];

  final _mybox=Hive.box("mybox");

  void createInitialData(){
    toDoList=[
      ["Morning",false]
    ];
  }
  //load data from database
  void loaddata(){
    toDoList=_mybox.get("TODOLIST");
  }

  //update data
  void updateDataBase(){
    _mybox.put("TODOLIST", toDoList);
  }

}