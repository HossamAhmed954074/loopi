import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial()) {
    getCurrentLocation();
  }

  Position? position;
  Completer<GoogleMapController> mapController = Completer();
  CameraPosition? myCurrentLocationCamiraPosition;

  Future<void> getCurrentLocation() async {
    emit(MapLoading());
    try {
      await getCurrentLocationHelper();
      position = await Geolocator.getLastKnownPosition().whenComplete(() {
        emit(MapSuccess());
      });

      myCurrentLocationCamiraPosition = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        tilt: 0.0,
        zoom: 17,
        bearing: 0.0,
      );
    }catch (e){
      emit(MapFailure(e.toString()));
    }
  }

  Future<void> goToCurrentLocation() async {
    final GoogleMapController _controller = await mapController.future;
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(myCurrentLocationCamiraPosition!),
    );
  }

  Future<Position> getCurrentLocationHelper() async {

    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(MapFailure('Location services are disabled.'));
     // return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        emit(MapFailure('Location permissions are denied'));
       // return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(MapFailure('Location permissions are permanently denied, we cannot request permissions.'));
      // return Future.error(
      //   'Location permissions are permanently denied, we cannot request permissions.',
      // );
    }

    return await Geolocator.getCurrentPosition();
  }
}
