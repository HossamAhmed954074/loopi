import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPlaceDirectionAndAllData {


  final String totalDistance;
  final String totalDuration;
  final String startAddress;
  final String endAddress;
  final LatLng latLngStart;
  final LatLng latLngEnd;

  MapPlaceDirectionAndAllData({


    required this.totalDistance,
    required this.totalDuration,
    required this.startAddress,
    required this.endAddress,
    required this.latLngStart,
    required this.latLngEnd,
  });

  factory MapPlaceDirectionAndAllData.fromJson(json) {
    final data = Map<String, dynamic>.from(json['routes'][0]);
    String distance;
    String duration;
    String startAddress;
    LatLng latLngStart;
    String endAddress;
    LatLng latLngEnd;

    final leg = data['legs'][0];
    distance = leg['distance']['text'];
    duration = leg['duration']['text'];
    endAddress = leg['end_address'];
    startAddress = leg['start_address'];
    latLngEnd = LatLng(leg['end_location']['lat'], leg['end_location']['lng']);
    latLngStart = LatLng(
      leg['start_location']['lat'],
      leg['start_location']['lng'],
    );

    return MapPlaceDirectionAndAllData(

      totalDistance: distance,
      totalDuration: duration,
      startAddress: startAddress,
      endAddress: endAddress,
      latLngStart: latLngStart,
      latLngEnd: latLngEnd,
    );
  }
}
