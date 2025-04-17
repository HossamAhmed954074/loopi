import 'package:final_project/constants/colors_constants.dart';
import 'package:flutter/material.dart';

import '../widgets/button_custom_widget.dart';
import '../widgets/text_button_custom.dart';
import '../widgets/text_form_field_custom_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              TextFormFieldCustom(labelTitle: 'Email'),
              TextFormFieldCustom(labelTitle: 'Password'),
              SizedBox(height: 10),
              ButtonCustom(
                buttonTitle: 'Login',
                buttonColor: MyColor.kButtonLoginColor,
                textColor: Colors.white,
              ),
              SizedBox(height: 10),
              Text('or Sign in With'),
              SizedBox(height: 10),
              ButtonCustom(
                buttonTitle: 'Continue with Google',
                buttonColor: MyColor.kButtonGoogleColor,
                textColor: Colors.black,
              ),
              SizedBox(height: 10),
              TextButtonCustom(textButton: 'Create an Account'),
            ],
          ),
        ),
      ),
    );
  }
}
