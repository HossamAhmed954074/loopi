part of 'suggestion_place_cubit.dart';

@immutable
sealed class SuggestionPlaceState {}

final class SuggestionPlaceInitial extends SuggestionPlaceState {}
final class SuggestionPlaceLoading extends SuggestionPlaceState {}
final class SuggestionPlaceFaliure extends SuggestionPlaceState {
  final String errorMessage;
  SuggestionPlaceFaliure({required this.errorMessage});
}
final class SuggestionPlaceSuccess extends SuggestionPlaceState {
  final List<PlaceSuggestion> placeSuggestList;
  SuggestionPlaceSuccess({required this.placeSuggestList});
}
