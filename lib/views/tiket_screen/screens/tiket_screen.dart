import 'package:flutter/material.dart';

import '../../../constants/routs_constants.dart';
import '../../login_register_screens/widgets/button_custom_widget.dart';

class TiketScreen extends StatelessWidget {
  const TiketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ButtonCustom(
              textColor: Colors.black,
              buttonTitle: 'get current Location',
              buttonColor: Colors.grey,
              onTap: () {
                Navigator.pushReplacementNamed(context, mapScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
