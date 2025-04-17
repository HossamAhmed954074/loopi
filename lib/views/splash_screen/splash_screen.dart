import 'package:final_project/constants/colors_constants.dart';
import 'package:final_project/views/get_started_screen/get_started_screen.dart';
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetStartedScreen(),));
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

