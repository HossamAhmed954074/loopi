import 'package:dio/dio.dart';
import 'package:final_project/secrets/secrets.dart';

class PlaceDetailsApiApi {
  Dio dio = Dio();
  String baseUrl = 'https://maps.googleapis.com/maps/api/place/details/json';

  Future getPlaseDetailsLocation(
    String placeId,
    String sessiontoken,
  ) async {
    try {
      Response response = await dio.get(
        baseUrl,
        queryParameters: {
          'place_id': placeId,
          // 'filds': 'geometry',
          'key': Secrets.mapsApiKey,
          'sessiontoken': sessiontoken,
        },
      );
      return response.data;
    } on Exception catch (e) {
      return Future.error(
        'Place Location error : ',
        StackTrace.fromString('this is its trace ${e.toString()}'),
      );
    }
  }
}
