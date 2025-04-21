import 'package:flutter/material.dart';

import '../../../constants/colors_constants.dart';

class FloatingActionCurrentLocationButtonCustomWidget extends StatelessWidget {
  const FloatingActionCurrentLocationButtonCustomWidget({super.key, required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.fromLTRB(0, 0, 8, 30),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: MyColor.kBlue,
        child: Icon(Icons.place, color: Colors.white),
      ),
    );
  }
}
