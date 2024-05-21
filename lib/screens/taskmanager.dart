import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyy/screens/addnewtask.dart';
import 'package:todoeyy/screens/model/ListBuilder.dart';
import 'model/Tasks.dart';

class TaskManager extends StatelessWidget {

  TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.sizeOf(context).height;
    var width=MediaQuery.sizeOf(context).width;

    return SafeArea (
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            shape: const CircleBorder(),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return NewTaskscreen(
                    //   callback: (String newtasktitle){
                    //       setState(() {
                    //            widget.tasks.add(Task(Name: newtasktitle));
                    //  });
                    //  Navigator.pop(context);
                    // },
                    );
                  } );
              //instead of witing whole function
            },
            child: const Icon(Icons.add,color: Colors.white,size: 40)
          ),
          backgroundColor: Colors.lightBlue,
          body:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30,top: 30,bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                        radius: width/10,
                        child: Icon(Icons.list,size: width/7,color: Colors.lightBlue,)),
                    SizedBox(height: (height/50)),
                    Text("Todeyy",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: (height/20),
                          fontWeight: FontWeight.w700
                      ),),
                    Text("${Provider.of<TaskData>(context,listen:true).taskcount} Tasks",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height/30,
                      ),)
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                  ),
                  child: TaskBuilder(),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
