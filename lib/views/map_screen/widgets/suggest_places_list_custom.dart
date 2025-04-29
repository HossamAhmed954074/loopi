import '../../../cubits/map_cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import '../../../models/map_auto_complet/place_sugestion.dart';
import 'list_view_suggest_body.dart';

class SuggestionPlacesList extends StatelessWidget {
  const SuggestionPlacesList({super.key, required this.onTap, required this.controller,});
  final Function(PlaceSuggestion) onTap;
  final FloatingSearchBarController controller ;
  @override
  Widget build(BuildContext context) {
    List<PlaceSuggestion> places;
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        if (state is SuggestionPlaceSuccess) {
          places = state.placeSuggestList;
          if (places.isNotEmpty) {
            return ListViewBody(places: places, onTap: onTap, controller: controller,);
          } else {
            return Text('not found ');
          }
        } else {
          return Text('not found ');
        }
      },
    );
  }
}