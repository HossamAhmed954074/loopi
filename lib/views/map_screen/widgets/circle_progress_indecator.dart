import 'package:flutter/material.dart';

import '../../../constants/colors_constants.dart';

class CircleProgressIndecator extends StatelessWidget {
  const CircleProgressIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: MyColor.kBlue),
    );
  }
}
