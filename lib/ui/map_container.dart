import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

import '../domain/shifts.dart';
import '../domain/user.dart';
import 'user_marker.dart';

class MapContainer extends StatelessWidget {
  final List<User> users;
  final List<Shift> shifts;

  MapContainer({Key? key, required this.users, required this.shifts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build map");

    final markers = users.map((e) {
      return Marker(
        point: LatLng(e.latitude, e.longitude),
        builder: (context) {
          final seconds = DateTime.parse(e.lastActiveAt).second.toDouble();
          final milliseconds = DateTime.parse(e.lastActiveAt).millisecond.toDouble() / 1000;
          return UserMarker(
            icon: Icons.person,
            color: Colors.blue,
            seconds: seconds + milliseconds,
          );
        },
      );
    }).toList();

    final shiftMarkers = shifts.map((e) {
      return Marker(
        point: LatLng(e.latitude, e.longitude),
        builder: (context) {
          final seconds = DateTime.parse(e.createdAt).second.toDouble();
          // final milliseconds = DateTime.parse(e.createdAt).millisecond.toDouble() / 1000;
          return UserMarker(
            seconds: seconds,
            icon: Icons.work,
            color: Colors.green,
          );
        },
      );
    }).toList();

    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.509364, -0.128928),
        zoom: 4,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: null,
        ),
      ],
      layers: [
        TileLayerOptions(
          urlTemplate:
              'https://api.maptiler.com/maps/e4b1e000-04ec-4f4f-8e42-26d411905ec2/{z}/{x}/{y}.png?key=rlVLZ5BgHtCX6bAzHmLW',
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(markers: [...markers, ...shiftMarkers])
      ],
    );
  }
}
