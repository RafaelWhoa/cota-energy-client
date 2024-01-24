import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: const Center(
        child:
          FlutterMap(options: MapOptions(
            initialCenter: LatLng(51.5, -0.09),
            initialZoom: 13.0,
          ), children: [])
      ),
    ));
  }
}
