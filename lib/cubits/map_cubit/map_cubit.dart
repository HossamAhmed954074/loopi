import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../apis/map_api/place_details_api.dart';
import '../../apis/map_api/place_direction_api.dart';
import '../../apis/map_api/place_suggestion_api.dart';
import '../../models/map_auto_complet/place_sugestion.dart';
import '../../models/map_place_details/map_place_details.dart';
import '../../models/map_place_direction/map_place_direction.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial()) {
    
  }

  Marker? markerMe;
  Marker? markerlo;
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
        zoom: 9,
        bearing: 0.0,
      );
    } catch (e) {
      emit(MapFailure(e.toString()));
    }
  }

  Future<void> goToCurrentLocation() async {
    final GoogleMapController _controller = await mapController.future;
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(myCurrentLocationCamiraPosition!),
    );
    markerMe = Marker(
      markerId: MarkerId('1'),
      position: LatLng(position!.latitude, position!.longitude),
    );
    emit(
      MarkerSuccess(
        marker: markerMe!,
        origon: LatLng(position!.latitude, position!.longitude),
      ),
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
      emit(
        MapFailure(
          'Location permissions are permanently denied, we cannot request permissions.',
        ),
      );
      // return Future.error(
      //   'Location permissions are permanently denied, we cannot request permissions.',
      // );
    }  

    return await Geolocator.getCurrentPosition();
  }

  Future getAllSuggestionPlace(String place) async {
    try {
      List<PlaceSuggestion> list = await PlaceSuggestionApi().fetchSuggestion(
        place,
        Uuid().v4(),
      );
      emit(SuggestionPlaceSuccess(placeSuggestList: list));
    } catch (e) {
      emit(SuggestionPlaceFaliure(errorMessage: e.toString()));
    }
  }

  Future getPlaceLocationDetails(String place) async {
    try {
      var mapPlaceDetails = await PlaceDetailsApiApi().getPlaseDetailsLocation(
        place,
        Uuid().v4(),
      );
      MapPlaceDetails m = MapPlaceDetails.fromJson(mapPlaceDetails);

      markerlo = Marker(
        markerId: MarkerId('2'),
        position: LatLng(
          m.result.geometry.location.lat,
          m.result.geometry.location.lng,
        ),
      );
      emit(DetailsPlacesSuccess(markerlo!, mapPlaceDetails: m));
    } catch (e) {
      log(e.toString());
      emit(DetailsPlacesFaluire(errorMessage: e.toString()));
    }
  }

  void getDirectionAndAllData({ required String end}) {
    PlaceDirectionApi().getDirectionAndAllData(start:LatLng(position!.latitude, position!.longitude) ,end: end).then((
      value,
    ) {
      emit(DirectionSuccess(mapPlaceDirectionAndAllData: value));
    });
  }
}
