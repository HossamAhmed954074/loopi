import 'dart:developer';
import 'package:final_project/cubits/map_cubit/map_cubit.dart';
import 'package:final_project/models/map_auto_complet/place_sugestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import '../../../models/map_place_direction/map_place_direction.dart';
import '../../login_register_screens/widgets/snackBarCustom.dart';
import '../widgets/circle_progress_indecator.dart';
import '../widgets/floating_action_current_location_button_custom_widget.dart';
import '../widgets/floating_search_bar_custom.dart';
import '../widgets/map_body.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Set<Marker> markers = Set();
  late PlaceSuggestion placeSuggestion;
  final FloatingSearchBarController controller = FloatingSearchBarController();

  MapPlaceDirectionAndAllData? mapPlaceDirectionAndAllData;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is MapFailure) {
          snackBarCustom(context, state.errorMassage);
        }
        if(state is MarkerSuccess){
          markers.add(state.marker);
        }
        if(state is DirectionSuccess){
          mapPlaceDirectionAndAllData = state.mapPlaceDirectionAndAllData;
        }
        if(state is DetailsPlacesSuccess){
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
                    ? CircleProgressIndecator()
                    : MapBody(
                      mapPlaceDirectionAndAllData: mapPlaceDirectionAndAllData,
                      marker: markers,
                      initialCameraPosition:
                          BlocProvider.of<MapCubit>(
                            context,
                          ).myCurrentLocationCamiraPosition!,
                      controller:
                          (c) => BlocProvider.of<MapCubit>(
                            context,
                          ).mapController.complete(c),
                    ),
                BuildFloatingSearchBar(
                  controller: controller,
                  onChange: (val) {
                    BlocProvider.of<MapCubit>(
                      context,
                    ).getAllSuggestionPlace(val);
                  },
                  onFocusChanged: (isBool) {
                    setState(() {
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
              ],
            ),
          ),
          floatingActionButton: FloatingActionCurrentLocationButtonCustomWidget(
            onPressed: () {
              BlocProvider.of<MapCubit>(context).goToCurrentLocation();
              BlocProvider.of<MapCubit>(
                context,
              ).getDirectionAndAllData( end: placeSuggestion.placeId);
              log('*************${mapPlaceDirectionAndAllData!.startAddress}**********${mapPlaceDirectionAndAllData!.endAddress}');
            },
          ),
        );
      },
    );
  }
}
