
import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Task {
  final String Name;
  bool isDone;

  Task({required this.Name,this.isDone=false});

  void isToggle()
  {
    isDone=!isDone;
  }
}

class TaskData extends ChangeNotifier{
  List<Task> _taskdata=[];
  void addtask(Task ob)
  {
    _taskdata.add(ob);
    notifyListeners();
  }

  UnmodifiableListView get ttaskdata{
    return UnmodifiableListView(_taskdata);
  }

  int get taskcount=>_taskdata.length;

  void deletetask(Task ob)
  {
    _taskdata.remove(ob);
    notifyListeners();
  }

  Task update(Task task)
  {
    task.isToggle();
    notifyListeners();
    return task;
  }

  void delete(Task task)
  {
    _taskdata.remove(task);
    notifyListeners();
  }
}