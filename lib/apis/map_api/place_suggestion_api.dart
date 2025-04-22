import 'dart:developer';

import 'package:dio/dio.dart';

import '../../models/map_auto_complet/place_sugestion.dart';

class PlaceSuggestionApi {
  Dio dio = Dio();
  String baseUrl =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  String apiKey = 'AIzaSyDFEC6jg_AQfCavA6DrMEo1Wvbm1D8OQfs';

  Future<List<PlaceSuggestion>> fetchSuggestion(
    String place,
    String sessionTaken,
  ) async {
    try {
      Response response = await dio.get(
        baseUrl,
        queryParameters: {
          'input': place,
          'type': 'address',
          'components': 'country:eg',
          'sessiontoken': sessionTaken,
          'key': apiKey,
        },
      );
      List data = response.data['predictions'];
      List<PlaceSuggestion> list=[];
      for(int i=0;i<data.length;i++){
        list.add(PlaceSuggestion.fromJson(data[i]));
      }
      return list;
    } catch (e) {
      return [];
    }
  }
}
