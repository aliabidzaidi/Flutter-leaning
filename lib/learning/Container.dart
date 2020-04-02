import 'package:flutter/material.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Container(
          color: Colors.deepPurpleAccent,
          child: new Text('This is my Container'),
          height: 200.0,
          width: 200.0,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          
        )
      )
    );
  }
}

