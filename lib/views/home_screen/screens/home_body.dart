import '../../../cubits/home_cubit/cubit/home_cubit.dart';
import '../../../main.dart';
import '../../../models/ticket_model/ticket_model.dart';
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
                SizedBox(
                  width: double.infinity,
                  child: AppBarCustomWidget(),
                ),
                if (state is HomeLoaded)
                  Expanded(child: Center(child:LoadingIndecatorCustomWidget())),
                if (state is Homesucess)
                  Expanded(
                    flex: 9,
                    child: ListView.builder(
                      itemCount: state.ticketModel.length,
                      itemBuilder: (context, index) {
                        return TicketsCustomWidget(ticketsModel: state.ticketModel[index],);
                      },
                    ),
                  ),
                 if(state is HomeFaluire)
                  Expanded(
                    flex: 9,
                    child: Center(
                      child: Text(
                        state.errorMessage,
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

class AppBarCustomWidget extends StatelessWidget {
  const AppBarCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[100],
      child: ListTile(
        leading: Image.asset('assets/images/icon.png'),
        title: Text(
          authUser,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('All Tikets ', style: TextStyle(fontSize: 16)),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_active_outlined),
        ),
      ),
    );
  }
}

class TicketsCustomWidget extends StatelessWidget {
  const TicketsCustomWidget({super.key, required this.ticketsModel});
final  TicketsModel ticketsModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ticketsModel.isArrived ? Colors.green[100] :Colors.yellow[100],
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ticketsModel.endLocation,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${ticketsModel.price} EGP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(ticketsModel.startLocation, style: TextStyle(fontSize: 14)),
                Text('50 MIN', style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 8),
            Text('d ${ticketsModel.dateTime.toDate().day}/ m ${ticketsModel.dateTime.toDate().month}  ** ${ticketsModel.dateTime.toDate().hour} : ${ticketsModel.dateTime.toDate().minute} AM backaup'),
            Text('9:45 AM Arrived'),
          ],
        ),
      ),
    );
  }
}
