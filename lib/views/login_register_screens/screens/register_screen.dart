import 'package:final_project/constants/routs_constants.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors_constants.dart';
import '../widgets/button_custom_widget.dart';
import '../widgets/text_button_custom.dart';
import '../widgets/text_form_field_custom_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                'Register',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              TextFormFieldCustom(labelTitle: 'Name'),
              TextFormFieldCustom(labelTitle: 'Email'),
              TextFormFieldCustom(labelTitle: 'Password'),
              SizedBox(height: 10),

              ButtonCustom(
                buttonTitle: 'Register',
                buttonColor: MyColor.kButtonLoginColor,
                textColor: Colors.white,
              ),
              SizedBox(height: 10),
              TextButtonCustom(
                textButton: 'Already have Account',
                onPressed: () => Navigator.pop(context, logInScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
