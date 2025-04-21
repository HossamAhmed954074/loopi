import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBody extends StatelessWidget {
  const MapBody({
    super.key,
    required this.initialCameraPosition,
    required this.controller,
  });

  final CameraPosition initialCameraPosition;
  final Function(GoogleMapController) controller;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: controller,
    );
  }
}