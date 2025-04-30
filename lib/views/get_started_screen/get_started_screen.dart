import '../../constants/colors_constants.dart';
import '../../constants/images_constants.dart';
import '../../constants/routs_constants.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(kLogo),
          Center(
            child: Text(
              'An app for convenient bus seat booking,',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Center(
            child: Text(
              'schedules, payments, and travel updates',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Center(
            child: Text(
              'in Egypt.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, logInScreen);
              },
              child: Text('LogIn'),
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, registerScreen);
            },
            child: Text(
              'Create an Account',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
