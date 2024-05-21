import 'package:flutter/material.dart';
import 'package:todoeyy/providereg.dart';
import 'package:provider/provider.dart';
import 'screens/taskmanager.dart';
import 'screens/model/Tasks.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});
 // Data ob=Data();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (BuildContext context) { return TaskData(); },
      child: MaterialApp(
        home: TaskManager(),
      ),
    );
  }
}



