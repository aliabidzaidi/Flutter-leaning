import 'package:flutter/material.dart';

void main() => runApp(StateFullApp());


class StateFullApp extends StatefulWidget {
  @override
  _StateFullAppState createState() => _StateFullAppState();
}

class _StateFullAppState extends State<StateFullApp> {
  String text = '';

  @override
  void initState() {
    // TODO: implement initState
    text = 'Click on this button';
    super.initState();
  }

  void buttonClicked(){
    setState((){
      text = 'Text is changed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Stateful Widget',
        home: new Scaffold(
          body: new Center(
            child: new RaisedButton(onPressed: (){
              buttonClicked();
            }, child: new Text(text)),
          ),
        )
    );
  }
}

