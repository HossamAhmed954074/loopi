import 'dart:developer';

import 'package:final_project/cubits/map_cubit/map_cubit.dart';
import 'package:final_project/models/map_auto_complet/place_sugestion.dart';
import 'package:final_project/models/map_place_details/map_place_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:uuid/uuid.dart';
import '../../login_register_screens/widgets/snackBarCustom.dart';
import '../widgets/circle_progress_indecator.dart';
import '../widgets/floating_action_current_location_button_custom_widget.dart';
import '../widgets/floating_search_bar_custom.dart';
import '../widgets/map_body.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> markers = Set();
  late PlaceSuggestion placeSuggestion;

  final FloatingSearchBarController controller = FloatingSearchBarController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is MapFailure) {
          snackBarCustom(context, state.errorMassage);
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
                  onFocusChanged: (isBool) {},
                  onTap: (val)  {
                    setState(() {
                      markers.clear();
                    });
                    placeSuggestion = val;
                    log(placeSuggestion.placeId);
                    BlocProvider.of<MapCubit>(
                      context,
                    ).getPlaceLocationDetails(val.placeId);
                    setState(() {

                    });
                    markers.add( BlocProvider.of<MapCubit>(context).markerlo!);
                    setState(() {

                    });
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionCurrentLocationButtonCustomWidget(
            onPressed: () {
              BlocProvider.of<MapCubit>(context).goToCurrentLocation();
              setState(() {

              });
              markers.add( BlocProvider.of<MapCubit>(context).markerMe!);
              setState(() {});
            },
          ),
        );
      },
    );
  }
}
