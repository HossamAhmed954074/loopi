import 'package:final_project/firebase_options.dart';
import 'package:final_project/views/get_started_screen/get_started_screen.dart';
import 'package:final_project/views/login_register_screens/screens/login_screen.dart';
import 'package:final_project/views/login_register_screens/screens/register_screen.dart';
import 'package:final_project/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants/routs_constants.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const LoopiApp());
}

class LoopiApp extends StatelessWidget {
  const LoopiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        splashScreen: (context) => SplashScreen(),
        getStartedScreen: (context) => GetStartedScreen(),
        logInScreen: (context) => LoginScreen(),
        registerScreen: (context) => RegisterScreen(),
      },
      initialRoute: splashScreen,
    );
  }
}
