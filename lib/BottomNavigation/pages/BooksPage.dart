import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {

  const BooksPage();

  static const TextStyle _textStyle = TextStyle(
      color: Colors.blueGrey,
      fontSize: 30,
      fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Books Page Content', style: _textStyle),
    );
  }
}
