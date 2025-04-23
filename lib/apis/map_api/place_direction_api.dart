import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/map_place_direction/map_place_direction.dart';


class PlaceDirectionApi {
  Dio dio = Dio();
  String baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json';
  String apiKey = 'AIzaSyDFEC6jg_AQfCavA6DrMEo1Wvbm1D8OQfs';

  Future<MapPlaceDirectionAndAllData> getDirectionAndAllData(
  {
   required String end,
  required  LatLng start,
}
      ) async {
    try {
      Response response = await dio.get(
        baseUrl,
        queryParameters: {
          'destination': 'place_id:$end',
          'origin': '${start.latitude},${start.longitude}',
          'key': apiKey,
        },
      );

      return MapPlaceDirectionAndAllData.fromJson(response.data);
    } catch (e) {
      return  Future.error(
        'Place Location error : ',
        StackTrace.fromString('this is its trace ${e.toString()}'),
      );
    }
  }
}