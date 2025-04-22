import 'package:bloc/bloc.dart';
import 'package:final_project/apis/map_api/place_suggestion_api.dart';
import 'package:meta/meta.dart';

import '../../models/map_auto_complet/place_sugestion.dart';

part 'suggestion_place_state.dart';

class SuggestionPlaceCubit extends Cubit<SuggestionPlaceState> {
  SuggestionPlaceCubit() : super(SuggestionPlaceInitial());

  Future getAllSuggestionPlace(String place, String sessionTaken) async {
    try {
      List<PlaceSuggestion> list = await PlaceSuggestionApi().fetchSuggestion(
        place,
        sessionTaken,
      );
      emit(SuggestionPlaceSuccess(placeSuggestList: list));
    } catch (e) {
      emit(SuggestionPlaceFaliure(errorMessage: e.toString()));
    }
  }
}
