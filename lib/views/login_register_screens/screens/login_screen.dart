import '../../../constants/colors_constants.dart';
import '../../../constants/routs_constants.dart';
import '../../../cubits/login_register_cubit/login_register_cubit.dart';
import '../widgets/snackBarCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/button_custom_widget.dart';
import '../widgets/text_button_custom.dart';
import '../widgets/text_form_field_custom_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginRegisterCubit, LoginRegisterState>(
      listener: (context, state) {
        if (state is LoginRegisterLoading) {
          isLoading = true;
        } else if (state is LoginRegisterSuccess) {
          Navigator.pushReplacementNamed(context, homeScreen);
          snackBarCustom(context, 'LogIn successfully');
          isLoading = false;
        } else if (state is LoginRegisterFailure) {
          snackBarCustom(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(),
            body: SizedBox(
              width: double.infinity,
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40),
                      TextFormFieldCustom(
                        labelTitle: 'Email',
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      TextFormFieldCustom(
                        labelTitle: 'Password',
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      SizedBox(height: 10),
                      ButtonCustom(
                        buttonTitle: 'Login',
                        buttonColor: MyColor.kButtonLoginColor,
                        textColor: Colors.white,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginRegisterCubit>(
                              context,
                            ).loginUser(email: email!, password: password!);
                          } else {}
                        },
                      ),
                      SizedBox(height: 10),
                      Text('or Sign in With'),
                      SizedBox(height: 10),
                      ButtonCustom(
                        buttonTitle: 'LogIn with Phone',
                        buttonColor: MyColor.kButtonGoogleColor,
                        textColor: Colors.black,
                        onTap: () {
                          Navigator.pushNamed(context, phoneScreen);
                        },
                      ),
                      SizedBox(height: 10),
                      TextButtonCustom(
                        textButton: 'Create an Account',
                        onPressed:
                            () => Navigator.pushNamed(context, registerScreen),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
