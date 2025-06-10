import 'dart:async';

import '../../../constants/routs_constants.dart';
import '../../../cubits/map_cubit/map_cubit.dart';
import '../../../models/map_auto_complet/place_sugestion.dart';
import '../../payment_screen/widgets/loading_indecator_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import '../../../constants/colors_constants.dart';
import '../../../models/map_place_direction/map_place_direction.dart';
import '../../login_register_screens/widgets/snackBarCustom.dart';
import '../widgets/floating_action_current_location_button_custom_widget.dart';
import '../widgets/floating_search_bar_custom.dart';
import '../widgets/map_body.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Set<Marker> markers = {};
 PlaceSuggestion? placeSuggestion;
  final FloatingSearchBarController controller = FloatingSearchBarController();
  bool iss = false;
  Completer<GoogleMapController> mapController = Completer();
  MapPlaceDirectionAndAllData? mapPlaceDirectionAndAllData;

  @override
  void initState() {
   BlocProvider.of<MapCubit>(context).getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is MapFailure) {
          snackBarCustom(context, state.errorMassage);
        }
        if (state is MarkerSuccess) {
          markers.add(state.marker);
        }
        if (state is DirectionSuccess) {
          mapPlaceDirectionAndAllData = state.mapPlaceDirectionAndAllData;
        }
        if (state is DetailsPlacesSuccess) {
          markers.add(state.marker);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Stack(
              fit: StackFit.expand,
              children: [
                state is MapLoading
                    ? LoadingIndecatorCustomWidget()
                    : MapBody(
                      mapPlaceDirectionAndAllData: mapPlaceDirectionAndAllData,
                      marker: markers,
                      initialCameraPosition:
                          BlocProvider.of<MapCubit>(
                            context,
                          ).myCurrentLocationCamiraPosition!,
                      controller: (c) => mapController.complete(c),
                          
                    ),
                BuildFloatingSearchBar(
                  controller: controller,
                  onChange: (val) {
                    BlocProvider.of<MapCubit>(
                      context,
                    ).getAllSuggestionPlace(val);
                  },
                  onFocusChanged: (isBool) {
                    controller.clear;
                    setState(() {
                      iss = false;
                      markers.clear();
                    });
                  },
                  onTap: (val) {
                    placeSuggestion = val;
                    BlocProvider.of<MapCubit>(
                      context,
                    ).getPlaceLocationDetails(val.placeId);
                  },
                ),

                Positioned(
                  bottom: 12,
                  left: 12,
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child:
                        iss
                            ? FloatingActionCurrentLocationButtonCustomWidget(
                              heroTag: 'but1',
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  tiketScreen,
                                  arguments: mapPlaceDirectionAndAllData,
                                );
                                controller.clear();
                              },
                              iconData: Icon(
                                FontAwesomeIcons.check,
                                color: Colors.white,
                              ),
                              backGroundColor: Colors.green,
                            )
                            : SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionCurrentLocationButtonCustomWidget(
            heroTag: 'but2',
            
            backGroundColor: MyColor.kBlue,
            onPressed: () {
              iss = true;
              setState(() {});
              BlocProvider.of<MapCubit>(context).goToCurrentLocation();
              BlocProvider.of<MapCubit>(
                context,
              ).getDirectionAndAllData(end: placeSuggestion!.placeId);
            },
            iconData: Icon(Icons.place, color: Colors.white),
          ),
        );
      },
    );
  }
}
