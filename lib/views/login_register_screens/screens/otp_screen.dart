import 'package:final_project/constants/routs_constants.dart';
import 'package:flutter/material.dart';
import '../widgets/button_custom_widget.dart';
import '../widgets/otp_code_fields_custom_widget.dart';
import '../widgets/text_button_custom.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  String? otpCode;

  @override
  Widget build(BuildContext context) {
    var phoneNumber = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verify your Phone Number',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Enter your 6 digits code numbers sent to you at +2 $phoneNumber . ',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 50),
              BuildPinCodeFields(otpCode: (code) => otpCode = code),
              ButtonCustom(
                textColor: Colors.black,
                buttonTitle: 'Verify',
                buttonColor: Colors.grey,
                onTap: () {},
              ),
              TextButtonCustom(
                textButton: 'Change Phone Number',
                onPressed:
                    () => Navigator.pushReplacementNamed(context, phoneScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
