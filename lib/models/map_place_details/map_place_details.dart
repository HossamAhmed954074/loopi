class MapPlaceDetails {
  final Result result;

  MapPlaceDetails({required this.result});

  factory MapPlaceDetails.fromJson(json) {
    return MapPlaceDetails(result: Result.fromJson(json['result']));
  }
}

class Result {
  final Geometry geometry;

  Result({required this.geometry});

  factory Result.fromJson(json) {
    return Result(geometry:Geometry.fromJson( json['geometry']));
  }
}

class Geometry {
  final Location location;

  Geometry({required this.location});

  factory Geometry.fromJson(json) {
    return Geometry(location:Location.fromJson( json['location']));
  }
}

class Location {
  final double lat;
  final double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(json) {
    return Location(lat: json['lat'],lng: json['lng']);
  }
}
