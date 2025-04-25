import 'package:final_project/cubits/botom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:final_project/cubits/login_register_cubit/login_register_cubit.dart';
import 'package:final_project/cubits/map_cubit/map_cubit.dart';
import 'package:final_project/cubits/payment_cubit/payment_cubit.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/views/get_started_screen/get_started_screen.dart';
import 'package:final_project/views/home_screen/screens/home_screen.dart';
import 'package:final_project/views/login_register_screens/screens/login_screen.dart';
import 'package:final_project/views/login_register_screens/screens/otp_screen.dart';
import 'package:final_project/views/login_register_screens/screens/phone_screen.dart';
import 'package:final_project/views/login_register_screens/screens/register_screen.dart';
import 'package:final_project/views/map_screen/screens/map_screen.dart';
import 'package:final_project/views/ticket_screen/screens/tiket_screen.dart';
import 'package:final_project/views/payment_screen/screens/payment_web_view.dart';
import 'package:final_project/views/payment_screen/screens/payments_screen.dart';
import 'package:final_project/views/profile_screen/screens/profile_screen.dart';
import 'package:final_project/views/splash_screen/splash_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/routs_constants.dart';
import 'cubits/app_theme_color/app_theme_cubit.dart';

late String initialRoute;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRoute = getStartedScreen;
    } else {
      initialRoute = homeScreen;
    }
  });
  runApp(const LoopiApp());
}

class LoopiApp extends StatelessWidget {
  const LoopiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginRegisterCubit()),
        BlocProvider(create: (context) => BottomNavigationBarCubit()),
        BlocProvider(create: (context) => MapCubit()),
        BlocProvider(create: (context) => AppThemeCubit()),
        BlocProvider(create: (context) => PaymentCubit()),

      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: BlocProvider
                .of<AppThemeCubit>(context)
                .isTheme ? ThemeData.dark() : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            routes: {
              splashScreen: (context) => SplashScreen(),
              getStartedScreen: (context) => GetStartedScreen(),
              logInScreen: (context) => LoginScreen(),
              registerScreen: (context) => RegisterScreen(),
              homeScreen: (context) => HomeScreen(),
              profileScreen: (context) => ProfileScreen(),
              tiketScreen: (context) => TiketScreen(),
              phoneScreen: (context) => PhoneScreen(),
              otpScreen: (context) => OtpScreen(),
              mapScreen: (context) => MapScreen(),
              paymentsScreen: (context) => PaymentsScreen(),
              paymentRequistBodyScreen: (context) => PaymentRequistBodyScreen(),
            },
            initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
