import 'package:flutter/material.dart';

class MoviesPage extends StatelessWidget {

  const MoviesPage();

  static const TextStyle _textStyle = TextStyle(
      color: Colors.blueGrey,
      fontSize: 30,
      fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Movies Page Content', style: _textStyle),
    );
  }
}
