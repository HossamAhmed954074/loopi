import 'package:final_project/constants/routs_constants.dart';
import 'package:final_project/cubits/botom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:final_project/views/home_screen/screens/home_body.dart';
import 'package:final_project/views/profile_screen/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../apis/map_api/place_suggestion_api.dart';
import '../../ticket_screen/screens/tiket_screen.dart';

class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlaceSuggestionApi().fetchSuggestion('za', 'jscbnhabchab41554');

    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.airplane_ticket),
                label: 'Ticket',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex:
                state is BottomNavigationBarHome
                    ? 0
                    : state is BottomNavigationBarTiket
                    ? 1
                    : 2,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey,
            onTap:
                (val) => BlocProvider.of<BottomNavigationBarCubit>(
                  context,
                ).changeItem(val),
          ),
          body:
              state is BottomNavigationBarHome
                  ? HomeBody()
                  : state is BottomNavigationBarTiket
                  ? TiketScreen()
                  : ProfileScreen(),
        );
      },
    );
  }
}
