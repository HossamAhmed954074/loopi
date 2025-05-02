import 'package:flutter/material.dart';


class FloatingActionCurrentLocationButtonCustomWidget extends StatelessWidget {
  const FloatingActionCurrentLocationButtonCustomWidget({super.key, required this.onPressed, required this.iconData, required this.backGroundColor, required this.heroTag});
  final Function() onPressed;
 final Icon iconData;
 final  Color backGroundColor;
 final String heroTag;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.fromLTRB(0, 0, 8, 30),
      child: FloatingActionButton(
        heroTag: heroTag,
        onPressed: onPressed,
        backgroundColor: backGroundColor,
        child: iconData,
      ),
    );
  }
}
