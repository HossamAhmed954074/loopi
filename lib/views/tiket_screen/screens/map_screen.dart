import 'package:final_project/constants/colors_constants.dart';
import 'package:final_project/cubits/map_cubit/map_cubit.dart';
import 'package:final_project/cubits/suggestion_place/suggestion_place_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:uuid/uuid.dart';
import '../../../models/map_auto_complet/place_sugestion.dart';
import '../../login_register_screens/widgets/snackBarCustom.dart';
import '../widgets/circle_progress_indecator.dart';
import '../widgets/floating_action_current_location_button_custom_widget.dart';
import '../widgets/floating_search_bar_custom.dart';
import '../widgets/map_body.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  void getPlacesSugestions(BuildContext context,String val) {
    final sesssionTaken = Uuid().v4();
    BlocProvider.of<SuggestionPlaceCubit>(
      context,
    ).getAllSuggestionPlace(val, sesssionTaken);
  }

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
                  controller: FloatingSearchBarController(),
                  onPressed: () {},
                  onChange: (val) {
                    getPlacesSugestions(context,val);
                  },
                  onFocusChanged: (isBool) {},
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionCurrentLocationButtonCustomWidget(
            onPressed:
                () => BlocProvider.of<MapCubit>(context).goToCurrentLocation(),
          ),
        );
      },
    );
  }
}







