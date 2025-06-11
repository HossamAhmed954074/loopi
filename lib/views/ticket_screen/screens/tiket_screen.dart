import 'dart:developer';

import 'package:final_project/constants/colors_constants.dart';
import 'package:final_project/constants/routs_constants.dart';
import 'package:final_project/cubits/ticket_cubit/cubit/ticket_cubit.dart';
import 'package:final_project/models/map_place_direction/map_place_direction.dart';
import 'package:final_project/views/ticket_screen/widgets/date_time_custom_widget.dart';
import 'package:final_project/views/ticket_screen/widgets/location_form_field_custom_widget.dart';
import '../../../apis/firebase_api/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../login_register_screens/widgets/button_custom_widget.dart';

// ignore: must_be_immutable
class TiketScreen extends StatefulWidget {
  const TiketScreen({super.key});

  @override
  State<TiketScreen> createState() => _TiketScreenState();
}

class _TiketScreenState extends State<TiketScreen> {
  MapPlaceDirectionAndAllData? mapData;

  bool isCash = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? fromWere, toWere;
  @override
  Widget build(BuildContext context) {
    var paymentCheeck = ModalRoute.of(context)!.settings.arguments ?? false;
    log(paymentCheeck.toString());
    var mapPlaceDirectionAndAllData =
        ModalRoute.of(context)!.settings.arguments;
    if (mapPlaceDirectionAndAllData is MapPlaceDirectionAndAllData) {
      mapData = mapPlaceDirectionAndAllData;
    }

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
            child: Form(
              key: formKey,
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
                                onChanged: (p0) {
                                  fromWere = p0;
                                },
                              ),
                            ),

                            Expanded(
                              flex: 1,
                              child: InkWell(
                                child: Image.asset('assets/images/map.png'),
                                onTap: () {
                                  Navigator.pushNamed(context, mapScreen);
                                },
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: LocationFormFieldCustomWidget(
                                labelTitle: 'To Were',
                                onChanged: (p0) {
                                  toWere = p0;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        if (mapPlaceDirectionAndAllData
                            is MapPlaceDirectionAndAllData)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Distance : ${mapPlaceDirectionAndAllData.totalDistance}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ' Time : ${mapPlaceDirectionAndAllData.totalDuration}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
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
                            buttonColor:
                                isCash == false ? Colors.grey : Colors.green,
                            onTap: () {
                              setState(() {
                                isCash = !isCash;
                              });
                            },
                          ),
                        ),
                      ),

                      Expanded(
                        child: Center(
                          child: ButtonCustom(
                            textColor: Colors.black,
                            buttonTitle: 'Payment Online',
                            buttonColor:
                                paymentCheeck == false
                                    ? Colors.grey
                                    : Colors.green,
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
                        if (formKey.currentState!.validate()) {
                          FireBaseApi().postData(
                            startPoint: mapData!.latLngStart,
                            endPoint: mapData!.latLngEnd,
                            startLocation: fromWere,
                            endLocation: toWere,
                            price:
                                (double.parse(
                                          mapData!.totalDistance
                                              .substring(
                                                0,
                                                mapData!.totalDistance.length -
                                                    3,
                                              )
                                              .trim(),
                                        ) *
                                        0.50)
                                    .round(),
                          );
                          Navigator.pushReplacementNamed(context, homeScreen);
                          // BlocProvider.of<BottomNavigationBarCubit>(
                          //   context,
                          // ).changeItem(0);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
