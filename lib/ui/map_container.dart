import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class MapContainer extends StatelessWidget {
  final List<Marker> users;
  final List<Marker> shifts;

  MapContainer({Key? key, required this.users, required this.shifts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        MarkerLayerOptions(markers: [...users, ...shifts])
      ],
    );
  }
}
