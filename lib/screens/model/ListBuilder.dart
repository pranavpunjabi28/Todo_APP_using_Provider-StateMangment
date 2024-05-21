import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyy/screens/tasktile.dart';
import 'Tasks.dart';


class TaskBuilder extends StatelessWidget {
  TaskBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taaskdata,child){
        return  ListView.builder(
          itemBuilder:(context,index){
            final Task task=taaskdata.ttaskdata[index];
            return Task_Tile(
                name: task.Name,
                ischecked:task.isDone,
                callback: (bool? newvalue){
                  // setState(() {
                  //   taaskdata.ttaskdata[index].isDone=newvalue!;
                  // });
                  taaskdata.update(task);
                },
              callback2: (){taaskdata.delete(task);},
            );
            },
          itemCount: Provider.of<TaskData>(context,listen: true).taskcount,);
        },
    );
  }
}
