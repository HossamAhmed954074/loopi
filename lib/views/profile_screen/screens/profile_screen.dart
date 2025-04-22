import 'package:final_project/constants/routs_constants.dart';
import 'package:final_project/cubits/app_theme_color/app_theme_cubit.dart';
import 'package:final_project/cubits/login_register_cubit/login_register_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/divider_custom_widget.dart';
import '../widgets/list_item_custom_button.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final LoginRegisterCubit loginRegisterCubit = LoginRegisterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginRegisterCubit,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: 80,
                height: 80,
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(48), // Image radius
                    child: Image.asset(
                      'assets/images/icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Text(
                  '${BlocProvider.of<LoginRegisterCubit>(context).getLoggedInUser().phoneNumber}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              DividerCustomWidget(),
              const SizedBox(height: 10),
              ListItemButton(
                leadingIcon: FontAwesomeIcons.person,
                title: 'Profile Details',
                trailing: Icon(Icons.arrow_forward_ios),

                onTap: () {},
              ),
              DividerCustomWidget(),
              const SizedBox(height: 10),
              ListItemButton(
                leadingIcon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                trailing: CupertinoSwitch(
                  value: BlocProvider.of<AppThemeCubit>(context).isTheme,
                  onChanged:
                      (val) => BlocProvider.of<AppThemeCubit>(
                        context,
                      ).changeTheme(val),
                ),

                onTap: () {},
              ),
              DividerCustomWidget(),
              const SizedBox(height: 10),
              ListItemButton(
                leadingIcon: FontAwesomeIcons.clockRotateLeft,
                title: 'Ticket History',
                trailing: Icon(Icons.arrow_forward_ios),

                onTap: () {},
              ),
              const SizedBox(height: 10),
              DividerCustomWidget(),
              const SizedBox(height: 10),
              ListItemButton(
                leadingIcon: Icons.settings,
                title: 'Settings',
                trailing: Icon(Icons.arrow_forward_ios),

                onTap: () {},
              ),
              const SizedBox(height: 10),
              DividerCustomWidget(),
              const SizedBox(height: 10),
              ListItemButton(
                leadingIcon: Icons.help,
                title: 'Help',
                trailing: Icon(Icons.arrow_forward_ios),

                onTap: () {},
              ),
              const SizedBox(height: 10),
              DividerCustomWidget(),
              const SizedBox(height: 10),
              ListItemButton(
                leadingIcon: FontAwesomeIcons.backward,
                title: 'LogOut',
                trailing: Icon(Icons.arrow_back_ios_new),

                onTap: () async {
                  await loginRegisterCubit.logOut();
                  Navigator.pushReplacementNamed(context, getStartedScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
