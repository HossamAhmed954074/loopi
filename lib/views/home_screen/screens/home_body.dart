import 'package:final_project/views/home_screen/widgets/app_bar_custom_widget.dart';
import 'package:final_project/views/home_screen/widgets/ticket_item_custom_widget.dart';
import '../../../cubits/home_cubit/cubit/home_cubit.dart';
import '../../payment_screen/widgets/loading_indecator_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getData();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 40, right: 8),
            child: Column(
              children: [
                SizedBox(width: double.infinity, child: AppBarCustomWidget()),
                if (state is HomeLoaded)
                  Expanded(
                    child: Center(child: LoadingIndecatorCustomWidget()),
                  ),
                if (state is HomeInitial)
                  Expanded(
                    child: Center(
                      child: Text(
                        'No Tickets Found',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ),
                  ),
                if (state is Homesucess)
                  Expanded(
                    flex: 9,
                    child: ListView.builder(
                      itemCount: state.ticketModel.length,
                      itemBuilder: (context, index) {
                        return TicketsCustomWidget(
                          ticketsModel: state.ticketModel[index],
                        );
                      },
                    ),
                  ),
                if (state is HomeFaluire)
                  Expanded(
                    flex: 9,
                    child: Center(
                      child: Text(
                        'Have Error Please Try again Later! ',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
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
