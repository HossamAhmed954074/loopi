import 'package:final_project/constants/routs_constants.dart';
import 'package:final_project/cubits/login_register_cubit/login_register_cubit.dart';
import 'package:final_project/views/login_register_screens/widgets/snackBarCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/button_custom_widget.dart';
import '../widgets/progress_indecator_custom_widget.dart';
import '../widgets/text_form_field_custom_widget.dart';

class PhoneScreen extends StatelessWidget {
  PhoneScreen({super.key});

  final GlobalKey<FormState> formState = GlobalKey();
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginRegisterCubit, LoginRegisterState>(
      listenWhen: (p, c) => p != c,
      listener: (context, state) {
        if (state is LoginRegisterLoading) {
          showProgressIndecator(context);
        } else if (state is LoginRegisterSuccess) {
          Navigator.pop(context);
          snackBarCustom(context, 'Verify code send');
          Navigator.pushReplacementNamed(
            context,
            otpScreen,
            arguments: phoneNumber,
          );
        } else if (state is LoginRegisterFailure) {
          Navigator.pop(context);
          snackBarCustom(context, state.errorMessage);
        }
      },
      builder:
          (context, state) => Scaffold(
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
                            BlocProvider.of<LoginRegisterCubit>(
                              context,
                            ).submitedPhoneNumber(phoneNumber!);
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
