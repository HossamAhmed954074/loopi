import 'package:final_project/views/tiket_screen/widgets/suggest_places_list_custom.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import '../../../models/map_auto_complet/place_sugestion.dart';
import '../../../models/map_place_direction/map_place_direction.dart';

class BuildFloatingSearchBar extends StatelessWidget {
  BuildFloatingSearchBar({
    super.key,
    required this.onChange,
    required this.onFocusChanged,
    required this.onTap,
    required this.controller,
  });

  final Function(PlaceSuggestion) onTap;

  final Function(String) onChange;
  final Function(bool) onFocusChanged;
  final FloatingSearchBarController controller;

  MapPlaceDirectionAndAllData? mapPlaceDirectionAndAllData;
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      controller: controller,
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: onChange,
      onFocusChanged: onFocusChanged,
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(showIfClosed: false),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:
            [
              SuggestionPlacesList(onTap: onTap, controller: controller),
            ],
          ),
        );
      },
    );
  }
}

