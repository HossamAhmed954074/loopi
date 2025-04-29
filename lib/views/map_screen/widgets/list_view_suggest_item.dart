
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../models/map_auto_complet/place_sugestion.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.onTap,
    required this.placeSuggestion, required this.controller,
  });

  final Function(PlaceSuggestion) onTap;
  final PlaceSuggestion placeSuggestion;
  final FloatingSearchBarController controller ;
  @override
  Widget build(BuildContext context) {
    var subtitle = placeSuggestion.description.replaceAll(
      placeSuggestion.description.split(',')[0],
      '',
    );
    return InkWell(
      onTap: (){
        onTap(placeSuggestion);
        controller.close();
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: MyColor.kLightBlue,
                ),
                child: Icon(Icons.place),
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${placeSuggestion.description.split(',')[0]}\n',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    TextSpan(
                      text: subtitle.substring(0),
                      style: TextStyle(fontSize: 14,color: Colors.black),

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}