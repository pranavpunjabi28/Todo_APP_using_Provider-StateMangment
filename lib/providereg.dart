import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class First extends StatelessWidget {
   First({super.key});

  @override
  Widget build(BuildContext context) {
    return Seacond();
  }
}
class MyText extends StatelessWidget {
  MyText({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}


class Seacond extends StatelessWidget {
  Seacond({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Mytextfield(),
        Third(),
      ],
    );
  }
}

class Mytextfield extends StatelessWidget with ChangeNotifier {

  Mytextfield({super.key});


  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newvalue){
       Provider.of<Data>(context,listen: false).onchange(newvalue);
      },
    );
  }
}


class Third extends StatelessWidget {
  Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context,listen: true).data);
  }
}

class Data extends ChangeNotifier
{
  String data='hello';
  void onchange(String newtext)
  {
    data=newtext;
    notifyListeners();
  }
}