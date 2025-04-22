import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/suggestion_place/suggestion_place_cubit.dart';
import '../../../models/map_auto_complet/place_sugestion.dart';
import 'list_view_suggest_body.dart';

class SuggestionPlacesList extends StatelessWidget {
  const SuggestionPlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    List<PlaceSuggestion> places;
    return BlocBuilder<SuggestionPlaceCubit, SuggestionPlaceState>(
      builder: (context, state) {
        if (state is SuggestionPlaceSuccess) {
          places = state.placeSuggestList;
          if (places.isNotEmpty) {
            return ListViewBody(places: places);
          } else {
            return Container(child: Text('not found '));
          }
        } else {
          return Container(child: Text('not found '));
        }
      },
    );
  }
}