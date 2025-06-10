import 'package:final_project/cubits/message_cubit/chat_cubit.dart';
import 'package:final_project/cubits/ticket_cubit/cubit/ticket_cubit.dart';
import 'package:final_project/views/message_screen/screens/message_screen.dart';

import 'cubits/botom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'cubits/home_cubit/cubit/home_cubit.dart';
import 'cubits/login_register_cubit/login_register_cubit.dart';
import 'cubits/map_cubit/map_cubit.dart';
import 'cubits/payment_cubit/payment_cubit.dart';
import 'firebase_options.dart';
import 'views/get_started_screen/get_started_screen.dart';
import 'views/home_screen/screens/home_screen.dart';
import 'views/login_register_screens/screens/login_screen.dart';
import 'views/login_register_screens/screens/otp_screen.dart';
import 'views/login_register_screens/screens/phone_screen.dart';
import 'views/login_register_screens/screens/register_screen.dart';
import 'views/map_screen/screens/map_screen.dart';
import 'views/ticket_screen/screens/tiket_screen.dart';
import 'views/payment_screen/screens/payment_web_view.dart';
import 'views/payment_screen/screens/payments_screen.dart';
import 'views/profile_screen/screens/profile_screen.dart';
import 'views/splash_screen/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/routs_constants.dart';
import 'cubits/app_theme_color/app_theme_cubit.dart';

late String initialRoute;
late String authUser;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => TicketCubit()),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme:
                BlocProvider.of<AppThemeCubit>(context).isTheme
                    ? ThemeData.dark()
                    : ThemeData.light(),
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
              messageScreen:
                  (context) => BlocProvider(
                    create: (context) => ChatCubit(),
                    child: MessageScreen(),
                  ),
            },
            initialRoute: splashScreen,
          );
        },
      ),
    );
  }
}
