import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:weather/pages/feed.dart';
import 'package:weather/pages/upload.dart';
import "package:latlong2/latlong.dart" as latLng;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Upload(),
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
                icon: IconButton(icon:Icon(Icons.upload),
                  onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Upload()));},),
                label: 'upload',
                backgroundColor: Colors.orangeAccent),
            BottomNavigationBarItem(
                icon: IconButton(icon:Icon(Icons.list), onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Feed()));
                },),
                label: 'Home',
                backgroundColor: Colors.orangeAccent),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
          elevation: 5),
      body: Container(
child: Stack(
  children: [
    FlutterMap(
      options: MapOptions(
        center: latLng.LatLng(51.509364, -0.128928),
        zoom: 3.2,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
      ],
    ),
  ],
),)
    );
  }
}
