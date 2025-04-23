part of 'map_cubit.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}
final class MapLoading extends MapState {}
final class MapSuccess extends MapState {

}
final class MarkerSuccess extends MapState {
 final Marker marker;
 final LatLng origon;

  MarkerSuccess({required this.marker, required this.origon});
}
final class MapFailure extends MapState {
  final String errorMassage;
  MapFailure(this.errorMassage);
}



final class SuggestionPlaceInitial extends MapState {}
final class SuggestionPlaceLoading extends MapState {}
final class SuggestionPlaceFaliure extends MapState {
  final String errorMessage;
  SuggestionPlaceFaliure({required this.errorMessage});
}
final class SuggestionPlaceSuccess extends MapState {
  final List<PlaceSuggestion> placeSuggestList;

  SuggestionPlaceSuccess( {required this.placeSuggestList});
}
final class DetailsPlacesFaluire extends MapState {
  final String errorMessage;

  DetailsPlacesFaluire({required this.errorMessage});
}
final class DetailsPlacesSuccess extends MapState {
  final MapPlaceDetails mapPlaceDetails;
  final Marker marker;


  DetailsPlacesSuccess(this.marker, {required this.mapPlaceDetails});
}

final class DirectionSuccess extends MapState {
  final MapPlaceDirectionAndAllData mapPlaceDirectionAndAllData;
  DirectionSuccess({required this.mapPlaceDirectionAndAllData});
}