import 'package:flutter/material.dart';

import '../../../constants/images_constants.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(kLogo),
    );
  }
}
