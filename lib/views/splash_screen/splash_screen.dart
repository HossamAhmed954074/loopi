import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/colors_constants.dart';
import '../../constants/routs_constants.dart';
import '../../main.dart';
import 'widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),() {
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user == null) {

          if(mounted){
            Navigator.pushReplacementNamed(context, getStartedScreen);
          }

        } else {
          if(user.email != null){
            authUser = user.email!;
          }else if(user.phoneNumber != null){
            authUser = user.phoneNumber!;
          }
          if(mounted) {
            Navigator.pushReplacementNamed(context, homeScreen);
          }
        }
      });
    },);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.kPrimaryColor,
      body: SplashViewBody(),
    );
  }
}

