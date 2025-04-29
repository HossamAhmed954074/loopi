
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import '../../../models/map_auto_complet/place_sugestion.dart';
import 'list_view_suggest_item.dart';

class ListViewBody extends StatelessWidget {
   const ListViewBody({
    super.key,
    required this.places, required this.onTap, required this.controller,
  });

   final FloatingSearchBarController controller ;

 final Function(PlaceSuggestion) onTap;
  final List<PlaceSuggestion> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: places.length,
      itemBuilder: (context, index) {
        return ListViewItem(
          placeSuggestion: places[index],
          onTap: onTap, controller: controller,
        );
      },
    );
  }
}