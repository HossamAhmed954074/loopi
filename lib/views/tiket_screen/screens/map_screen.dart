import 'package:final_project/constants/colors_constants.dart';
import 'package:final_project/cubits/map_cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../login_register_screens/widgets/snackBarCustom.dart';
import '../widgets/circle_progress_indecator.dart';
import '../widgets/floating_action_current_location_button_custom_widget.dart';
import '../widgets/map_body.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
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
          body: Stack(
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
            ],
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
