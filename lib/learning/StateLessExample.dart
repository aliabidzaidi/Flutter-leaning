import 'package:flutter/material.dart';

void main() => runApp(new StatelessApp());

class StatelessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Stateless Widget',
        home: new Scaffold(
          body: new Container(
            color: Colors.redAccent,
            child: new Container(
              color: Colors.orange,
              margin: const EdgeInsets.all(30.0),
            ),
          ),
        )
    );
  }
}
