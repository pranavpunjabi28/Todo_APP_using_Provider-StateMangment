import 'package:flutter/material.dart';

class Task_Tile extends StatelessWidget {

  Task_Tile({required this.name,this.ischecked=false,required this.callback,required this.callback2});
  bool ischecked;
  String name;
  ValueChanged<bool?> callback;
  VoidCallback callback2;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: callback2,
      title:Text(name,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            decoration: ischecked? TextDecoration.lineThrough:TextDecoration.none),),
      trailing:Checkbox(value:ischecked , onChanged: callback)
    );
  }
}