import '../../constants/colors_constants.dart';
import '../../constants/routs_constants.dart';
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
    Future.delayed(Duration(seconds:3 ) ,() {
      // ignore: use_build_context_synchronously
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

