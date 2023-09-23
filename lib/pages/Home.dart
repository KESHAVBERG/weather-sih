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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
