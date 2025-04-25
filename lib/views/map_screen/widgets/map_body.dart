import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../models/map_place_direction/map_place_direction.dart';

class MapBody extends StatelessWidget {
  const MapBody({
    super.key,
    required this.initialCameraPosition,
    required this.controller, required this.marker, this.mapPlaceDirectionAndAllData,
  });
  final Set<Marker> marker;
  final CameraPosition initialCameraPosition;
  final Function(GoogleMapController) controller;
  final MapPlaceDirectionAndAllData? mapPlaceDirectionAndAllData;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: marker,
      initialCameraPosition: initialCameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: controller,
    );
  }
}