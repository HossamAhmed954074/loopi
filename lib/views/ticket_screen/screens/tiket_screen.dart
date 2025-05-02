import 'package:final_project/constants/colors_constants.dart';
import 'package:final_project/constants/routs_constants.dart';
import 'package:final_project/cubits/ticket_cubit/cubit/ticket_cubit.dart';
import 'package:final_project/views/ticket_screen/widgets/date_time_custom_widget.dart';
import 'package:final_project/views/ticket_screen/widgets/location_form_field_custom_widget.dart';
import '../../../apis/firebase_api/firebase_api.dart';
import '../../../cubits/botom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../login_register_screens/widgets/button_custom_widget.dart';

class TiketScreen extends StatelessWidget {
  const TiketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketCubit, TicketState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'book your bus',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xff116c9e),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Image.asset(
                        'assets/images/layer.png',
                        width: 120,
                        height: 80,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 5,
                            child: LocationFormFieldCustomWidget(
                              labelTitle: 'from Were',
                              onChanged: (p0) {},
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: InkWell(
                              child: Image.asset('assets/images/map.png'),
                              onTap: () {},
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: LocationFormFieldCustomWidget(
                              labelTitle: 'To Were',
                              onChanged: (p0) {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      DateTimeCustomWidget(
                        onConfirm: (date) {
                          BlocProvider.of<TicketCubit>(
                            context,
                          ).getDateTime(date);
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('one Way'), Text('Round Trip')],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: ButtonCustom(
                          textColor: Colors.black,
                          buttonTitle: 'Cash',
                          buttonColor: Colors.grey,
                          onTap: () {},
                        ),
                      ),
                    ),

                    Expanded(
                      child: Center(
                        child: ButtonCustom(
                          textColor: Colors.black,
                          buttonTitle: 'Payment Online',
                          buttonColor: Colors.grey,
                          onTap: () {
                            Navigator.pushNamed(context, paymentsScreen);
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                Center(
                  child: ButtonCustom(
                    textColor: Colors.black,
                    buttonTitle: 'Confirm',
                    buttonColor: MyColor.kButtonLoginColor,
                    onTap: () {
                      FireBaseApi().postData();
                      BlocProvider.of<BottomNavigationBarCubit>(
                        context,
                      ).changeItem(0);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}