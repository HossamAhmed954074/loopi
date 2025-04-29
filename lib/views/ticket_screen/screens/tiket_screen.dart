import '../../../apis/firebase_api/firebase_api.dart';
import '../../../cubits/botom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login_register_screens/widgets/button_custom_widget.dart';

class TiketScreen extends StatelessWidget {
  const TiketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create New Ticket',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ButtonCustom(
              textColor: Colors.black,
              buttonTitle: 'done',
              buttonColor: Colors.grey,
              onTap: () {
                FireBaseApi().postData();
                BlocProvider.of<BottomNavigationBarCubit>(
                  context,
                ).changeItem(0);
              
              },
            ),
          ),
        ],
      ),
    );
  }
}



// Center(
// child: ButtonCustom(
// textColor: Colors.black,
// buttonTitle: 'get current Location',
// buttonColor: Colors.grey,
// onTap: () {
// Navigator.pushNamed(context, mapScreen);
// },
// ),
// ),
// Center(
// child: ButtonCustom(
// textColor: Colors.black,
// buttonTitle: 'Payment screen',
// buttonColor: Colors.grey,
// onTap: () {
// Navigator.pushNamed(context, paymentsScreen);
// },
// ),
// ),