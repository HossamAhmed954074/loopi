import 'package:final_project/constants/colors_constants.dart';
import 'package:final_project/constants/routs_constants.dart';
import 'package:final_project/views/splash_screen/widgets/splash_view_body.dart';
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
    Future.delayed(Duration(seconds:3 ) ,() {
      Navigator.pushReplacementNamed(context, getStartedScreen);
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

