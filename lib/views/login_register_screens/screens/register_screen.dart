import '../../../constants/routs_constants.dart';
import '../../../cubits/login_register_cubit/login_register_cubit.dart';
import '../widgets/snackBarCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../constants/colors_constants.dart';
import '../widgets/button_custom_widget.dart';
import '../widgets/text_button_custom.dart';
import '../widgets/text_form_field_custom_widget.dart';

// ignore: must_be_immutable

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  String? emailAddress;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginRegisterCubit, LoginRegisterState>(
      listener: (context, state) {
        if (state is LoginRegisterLoading) {
          isLoading = true;
        } else if (state is LoginRegisterSuccess) {
          //todo navigate to next page
          snackBarCustom(context, 'the account created successfully go to Log In');
          isLoading = false;
        } else if (state is LoginRegisterFailure) {
          isLoading =false;
          snackBarCustom(context, state.errorMessage);
        }
      },
      builder: (context ,state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),

                    TextFormFieldCustom(
                      labelTitle: 'Email',
                      onChanged: (val) => emailAddress = val,
                    ),
                    TextFormFieldCustom(
                      labelTitle: 'Password',
                      onChanged: (val) => password = val,
                    ),
                    SizedBox(height: 10),

                    ButtonCustom(
                      buttonTitle: 'Register',
                      buttonColor: MyColor.kButtonLoginColor,
                      textColor: Colors.white,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginRegisterCubit>(
                            context,
                          ).registerUser(
                            email: emailAddress!,
                            password: password!,
                          );
                        } else {
                          snackBarCustom(context, 'there was an error');
                        }
                      },
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
          ),
        ),
      ),
    );
  }
}
