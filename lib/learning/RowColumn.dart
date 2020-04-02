import 'package:flutter/material.dart';

void main(){
  runApp(RowColumn());
}

class RowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Row Column Example'),),
        body: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Hello'),
            new Text('Abid'),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('Someting'),
                new Text('is not right'),

              ],
            )
          ],
        ),
      )
    );
  }
}

