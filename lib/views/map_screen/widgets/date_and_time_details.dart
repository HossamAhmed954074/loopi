import '../../../constants/colors_constants.dart';
import 'package:flutter/material.dart';

import '../../../models/map_place_direction/map_place_direction.dart';

class DateAndTimeDetails extends StatelessWidget {
  const DateAndTimeDetails({
    super.key,
    required this.mapPlaceDirectionAndAllData,
    required this.isVisible,
  });

  final MapPlaceDirectionAndAllData mapPlaceDirectionAndAllData;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Positioned(
        top: 0,
        bottom: 570,
        left: 0,
        right: 0,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                color: Colors.white,

                child: ListTile(
                  dense: true,
                  horizontalTitleGap: 0,
                  leading: Icon(
                    Icons.access_time_filled,
                    color: MyColor.kBlue,
                    size: 30,
                  ),
                  title: Text(
                    mapPlaceDirectionAndAllData.totalDuration,
                    style: TextStyle(color: Colors.black,fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            SizedBox(width: 30,),
            Flexible(
              flex: 1,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                color: Colors.white,

                child: ListTile(
                  dense: true,
                  horizontalTitleGap: 0,
                  leading: Icon(
                    Icons.directions_car_filled,
                    color: MyColor.kBlue,
                    size: 30,
                  ),
                  title: Text(
                    mapPlaceDirectionAndAllData.totalDistance,
                    style: TextStyle(color: Colors.black,fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
