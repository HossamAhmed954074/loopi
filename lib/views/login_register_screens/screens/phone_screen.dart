import 'package:final_project/constants/routs_constants.dart';
import 'package:final_project/cubits/login_register_cubit/login_register_cubit.dart';
import 'package:final_project/views/login_register_screens/widgets/snackBarCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/button_custom_widget.dart';
import '../widgets/text_form_field_custom_widget.dart';

class PhoneScreen extends StatelessWidget {
  PhoneScreen({super.key});

  final GlobalKey<FormState> formState = GlobalKey();
  String? keyNumber, phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginRegisterCubit(),
      child: Scaffold(
        body: Form(
          key: formState,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What is your Phone Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Please enter your phone number to verify your account . ',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormFieldCustom(
                          labelTitle: 'key',
                          onChanged: (val) => keyNumber = val,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFormFieldCustom(
                          labelTitle: 'phone Number',
                          onChanged: (val) => phoneNumber = val,
                        ),
                      ),
                    ],
                  ),
                  ButtonCustom(
                    textColor: Colors.black,
                    buttonTitle: 'send',
                    buttonColor: Colors.grey,
                    onTap: () {
                      if (formState.currentState!.validate()) {
              
                        //todo add a cubit auth here
              
                        Navigator.pushReplacementNamed(context, otpScreen,arguments: phoneNumber);
                        snackBarCustom(context, 'Verify code send');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
