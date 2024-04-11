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
        CircleLayer(
          circles: [
            CircleMarker(
              point: latLng.LatLng(12.9716, 77.5946,), // center of 't Gooi
              radius: 5000,
              useRadiusInMeter: true,
              color: Colors.red.withOpacity(1),
              borderColor: Colors.red.withOpacity(1),
              borderStrokeWidth: 2,
            ),
            CircleMarker(
              point: latLng.LatLng(13.0827, 80.2707,), // center of 't Gooi
              radius: 5000,
              useRadiusInMeter: true,
              color: Colors.red.withOpacity(1),
              borderColor: Colors.red.withOpacity(1),
              borderStrokeWidth: 2,
            ),
            CircleMarker(
              point: latLng.LatLng(13.0524, 80.2005,), // center of 't Gooi
              radius: 5000,
              useRadiusInMeter: true,
              color: Colors.red.withOpacity(1),
              borderColor: Colors.red.withOpacity(1),
              borderStrokeWidth: 2,
            ),

            CircleMarker(
              point: latLng.LatLng(13.0640, 77.6412,), // center of 't Gooi
              radius: 5000,
              useRadiusInMeter: true,
              color: Colors.red.withOpacity(1),
              borderColor: Colors.red.withOpacity(1),
              borderStrokeWidth: 2,
            ),
            CircleMarker(
              point: latLng.LatLng(13.0609, 80.1040,), // center of 't Gooi
              radius: 5000,
              useRadiusInMeter: true,
              color: Colors.red.withOpacity(1),
              borderColor: Colors.red.withOpacity(1),
              borderStrokeWidth: 2,
            ),
            CircleMarker(
              point: latLng.LatLng(12.9753, 77.6295,), // center of 't Gooi
              radius: 5000,
              useRadiusInMeter: true,
              color: Colors.red.withOpacity(1),
              borderColor: Colors.red.withOpacity(1),
              borderStrokeWidth: 2,
            ),
            CircleMarker(
              point: latLng.LatLng(11.1416, 79.0745,), // center of 't Gooi
              radius: 5000,
              useRadiusInMeter: true,
              color: Colors.red.withOpacity(1),
              borderColor: Colors.red.withOpacity(1),
              borderStrokeWidth: 2,
            ),
            CircleMarker(
              point: latLng.LatLng(11.2435, 78.8682,), // center of 't Gooi
              radius: 5000,
              useRadiusInMeter: true,
              color: Colors.red.withOpacity(1),
              borderColor: Colors.red.withOpacity(1),
              borderStrokeWidth: 2,
            ),
            CircleMarker(
              point: latLng.LatLng(8.1724, 77.4200,), // center of 't Gooi
              radius: 5000,
              useRadiusInMeter: true,
              color: Colors.red.withOpacity(1),
              borderColor: Colors.red.withOpacity(1),
              borderStrokeWidth: 2,
            ),
            CircleMarker(
              point: latLng.LatLng(8.5819, 76.8434,), // center of 't Gooi
              radius: 5000,
              useRadiusInMeter: true,
              color: Colors.red.withOpacity(1),
              borderColor: Colors.red.withOpacity(1),
              borderStrokeWidth: 2,
            ),
            CircleMarker(
              point: latLng.LatLng(9.0048, 76.7818,),
              radius: 5000,
              useRadiusInMeter: true,
              color: Colors.red.withOpacity(1),
              borderColor: Colors.red.withOpacity(1),
              borderStrokeWidth: 2,
            ),



          ],
        )
      ],
    ),
  ],
),)
    );
  }
}
