import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

  const SettingsPage();

  static const TextStyle _textStyle = TextStyle(
      color: Colors.blueGrey,
      fontSize: 30,
      fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Page Content', style: _textStyle),
    );
  }
}
