import '../../../constants/routs_constants.dart';
import '../../../cubits/login_register_cubit/login_register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/button_custom_widget.dart';
import '../widgets/otp_code_fields_custom_widget.dart';
import '../widgets/progress_indecator_custom_widget.dart';
import '../widgets/snackBarCustom.dart';
import '../widgets/text_button_custom.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneNumber = ModalRoute.of(context)!.settings.arguments;
    String? otpCode;
    return BlocConsumer<LoginRegisterCubit, LoginRegisterState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is LoginRegisterLoading) {
          showProgressIndecator(context);
        } else if (state is PhoneOtpVerified) {
          Navigator.pop(context);
          snackBarCustom(context, 'Verify Successfully');
          Navigator.pushReplacementNamed(
            context,
            homeScreen,
            arguments: phoneNumber,
          );
        } else if (state is LoginRegisterFailure) {
          Navigator.pop(context);
          snackBarCustom(context, state.errorMessage);
        }
      },
      builder: (context, state) {
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
                    onTap: () {
                      BlocProvider.of<LoginRegisterCubit>(
                        context,
                      ).submitedOTP(otpCode!);
                    },
                  ),
                  TextButtonCustom(
                    textButton: 'Change Phone Number',
                    onPressed:
                        () => Navigator.pushReplacementNamed(
                          context,
                          phoneScreen,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
