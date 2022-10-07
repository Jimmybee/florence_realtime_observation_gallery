import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../ui/colors/colors.dart';
import '../ui/user_marker.dart';

class ShiftsResponse {
  ShiftsResponse({
    required this.postedShifts,
  });
  late final List<Shift> postedShifts;

  ShiftsResponse.fromJson(Map<String, dynamic> json) {
    postedShifts = List.from(json['posted_shifts']).map((e) => Shift.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['posted_shifts'] = postedShifts.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Shift {
  Shift({
    required this.createdAt,
    required this.longitude,
    required this.latitude,
  });
  late final String createdAt;
  late final double longitude;
  late final double latitude;

  Shift.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['created_at'] = createdAt;
    _data['longitude'] = longitude;
    _data['latitude'] = latitude;
    return _data;
  }

  Marker toMarker() {
    return Marker(
      point: LatLng(latitude, longitude),
      builder: (context) {
        final seconds = DateTime.parse(createdAt).second.toDouble();
        return UserMarker(
          seconds: seconds,
          icon: Icons.work,
          color: kFlorencePurpleLight,
        );
      },
    );
  }
}
