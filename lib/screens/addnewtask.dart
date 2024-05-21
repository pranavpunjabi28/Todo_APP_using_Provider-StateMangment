import 'package:flutter/material.dart';
import 'model/ListBuilder.dart';
import 'model/Tasks.dart';
import 'package:provider/provider.dart';

class NewTaskscreen extends StatelessWidget {
  NewTaskscreen({super.key});
  String ? value;
  TextEditingController _Controller=TextEditingController();
  // ValueChanged<String> callback;
  // @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Add Task",
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 40),
                ),
                TextField(
                  controller: _Controller,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                     color: Colors.black,
                     fontSize: 20),
                  cursorColor: Colors.blueAccent,
                  keyboardType:TextInputType.text ,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue,width: 2.0)
                    ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent,width:3.0),
                      ),
                  ),
                  onChanged: (text){
                    value=text ;},
                  onSubmitted: (newtasktitle){
                    String name=newtasktitle;
                    if(name!=""){
                      Task newtask=Task(Name:name);
                      _Controller.clear();
                      value='';
                      Provider.of<TaskData>(context,listen: false).addtask(newtask);
                      //callback(value!);
                    }
                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextButton(
                      onPressed: (){
                        if(value!='')
                          {
                            Task newtask=Task(Name:value!);
                            _Controller.clear();
                            value='';
                            Provider.of<TaskData>(context,listen: false).addtask(newtask);
                            Navigator.pop(context);
                            //callback(value!);
                          }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(21),
                                    bottomRight: Radius.circular(21)),
                                side: BorderSide(color: Colors.blueAccent)
                            )
                        ),
                      ),
                      child: const Text("Add",style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                )
              ],
            ),
          ),
    );
  }
}
