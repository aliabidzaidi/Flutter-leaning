import 'package:flutter/material.dart';

class SongsPage extends StatelessWidget {

  const SongsPage();

  static const TextStyle _textStyle = TextStyle(
      color: Colors.blueGrey,
      fontSize: 30,
      fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Songs Page Content', style: _textStyle),
    );
  }
}
