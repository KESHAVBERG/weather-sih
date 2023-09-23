import 'package:flutter/material.dart';
import 'package:weather/pages/feed.dart';
import 'package:weather/pages/upload.dart';

import 'Home.dart';
class NavigatorClass extends StatefulWidget {
  const NavigatorClass({Key? key}) : super(key: key);

  @override
  State<NavigatorClass> createState() => _NavigatorClassState();
}

class _NavigatorClassState extends State<NavigatorClass> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Upload(),
    Feed()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.orangeAccent),
            BottomNavigationBarItem(
              icon: Icon(Icons.upload),
              label: 'upload',
              backgroundColor: Colors.orangeAccent,),
            BottomNavigationBarItem(
                icon:Icon(Icons.list),
                label: 'Home',
                backgroundColor: Colors.orangeAccent),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
          elevation: 5),
      body: _widgetOptions[_selectedIndex],
    );
  }
}

// class NavigatorClass extends StatefulWidget {
//   const NavigatorClass({Key? key}) : super(key: key);
//
//   @override
//   State<NavigatorClass> createState() => _NavigatorClassState();
// }
//
// class _NavigatorState extends State<NavigatorClass> {

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
