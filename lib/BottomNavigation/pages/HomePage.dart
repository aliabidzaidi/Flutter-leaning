import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  const HomePage();

  static const TextStyle _textStyle = TextStyle(
    color: Colors.blueGrey,
    fontSize: 30,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page Content', style: _textStyle),
    );
  }
}
