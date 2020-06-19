import 'package:flutter/material.dart';
import 'package:flutterlearning/BottomNavigation/pages/HomePage.dart';
import 'package:flutterlearning/BottomNavigation/pages/BooksPage.dart';
import 'package:flutterlearning/BottomNavigation/pages/MoviesPage.dart';
import 'package:flutterlearning/BottomNavigation/pages/SongsPage.dart';
import 'package:flutterlearning/BottomNavigation/pages/SettingsPage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Bottom Navigation Example',
      home: Master(),
    );
  }
}


class Master extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Master> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BooksPage(),
    MoviesPage(),
    SongsPage(),
    SettingsPage(),
  ];

  int _selectedIndex = 0;

  void onItemTapped(int index) {
    print(index.toString() + ' Clicked');
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Diary 🤔'),
        backgroundColor: Colors.green,

      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
//          border: Border(
//            top: BorderSide(
//              color: Colors.black54,
//              width: 1
//            )
//          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
//              offset: Offset(0, -1), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text('Books'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library),
              title: Text('Movies'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.queue_music), title: Text('Songs')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('Setting')),
          ],
          currentIndex: _selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: Colors.green.shade700,
          unselectedItemColor: Colors.black54,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
