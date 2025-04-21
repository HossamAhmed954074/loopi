import 'package:final_project/constants/routs_constants.dart';
import 'package:final_project/cubits/login_register_cubit/login_register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login_register_screens/widgets/button_custom_widget.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
final LoginRegisterCubit loginRegisterCubit = LoginRegisterCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginRegisterCubit,
      child: Scaffold(
        body: Center(
          child: ButtonCustom(
            textColor: Colors.black,
            buttonColor: Colors.grey,
            buttonTitle: 'log out',
            onTap: () async{
              await loginRegisterCubit.logOut();
              Navigator.pushReplacementNamed(context,getStartedScreen);
            },
          ),
        ),
      ),
    );
  }
}
