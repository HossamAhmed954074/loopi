
import 'package:flutter/material.dart';

import '../../../models/map_auto_complet/place_sugestion.dart';
import 'list_view_suggest_item.dart';

class ListViewBody extends StatelessWidget {
  const ListViewBody({
    super.key,
    required this.places,
  });

  final List<PlaceSuggestion> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: places.length,
      itemBuilder: (context, index) {
        print('********* ${places[index].description}');
        return ListViewItem(
          onTap: () {},
          placeSuggestion: places[index],
        );
      },
    );
  }
}