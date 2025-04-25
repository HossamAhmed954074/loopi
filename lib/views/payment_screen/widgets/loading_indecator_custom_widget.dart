import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingIndecatorCustomWidget extends StatelessWidget {
  const LoadingIndecatorCustomWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: LoadingIndicator(
          indicatorType: Indicator.lineScale,
          colors: const [
            Colors.purpleAccent,
            Colors.orangeAccent,
            Colors.cyanAccent,
            Colors.white,
          ],
          strokeWidth: 2,
        ),
      ),
    );
  }
}