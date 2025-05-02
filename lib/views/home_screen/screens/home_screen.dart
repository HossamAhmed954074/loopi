import '../../../cubits/botom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'home_body.dart';
import '../../profile_screen/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex:
                state is BottomNavigationBarHome
                    ? 0
                    : 1,
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
                  
                  : ProfileScreen(),
        );
      },
    );
  }
}
