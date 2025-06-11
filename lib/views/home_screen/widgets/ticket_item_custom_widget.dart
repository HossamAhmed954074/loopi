import 'package:final_project/cubits/home_cubit/cubit/home_cubit.dart';
import 'package:final_project/models/ticket_model/ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

class TicketsCustomWidget extends StatelessWidget {
  const TicketsCustomWidget({super.key, required this.ticketsModel});
  final TicketsModel ticketsModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: ticketsModel.isArrived ? Colors.green[100] : Colors.yellow[100],
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: SwipeActionCell(
        key: ValueKey(ticketsModel.id),
        trailingActions: [
          SwipeAction(
            widthSpace: 60,
            performsFirstActionWithFullSwipe: true,
            title: 'Delete',
            onTap: (controller) async {
              await BlocProvider.of<HomeCubit>(
                context,
              ).deleteData(ticketsModel.id!);
            },
            color: Colors.red,
          ),
        ],
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
                  Text(
                    ticketsModel.startLocation,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text('50 MIN', style: TextStyle(fontSize: 14)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${ticketsModel.dateTime.toDate().day} / ${ticketsModel.dateTime.toDate().month} ',
                  ),
                  Text(
                    '${ticketsModel.dateTime.toDate().hour} : ${ticketsModel.dateTime.toDate().minute} AM backaup',
                  ),
                   Text('9:45 AM Arrived'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  if (!ticketsModel.isAccepted)
                    Text('Accepted', style: TextStyle(color: Colors.red)),
                  if (ticketsModel.isAccepted)
                    Text('Accepted', style: TextStyle(color: Colors.green)),
                  if (!ticketsModel.isArrived)
                    Text('Arrived', style: TextStyle(color: Colors.red)),
                  if (ticketsModel.isArrived)
                    Text('Arrived', style: TextStyle(color: Colors.green)),
                  if (!ticketsModel.isPackUp)
                    Text('pack up', style: TextStyle(color: Colors.red)),
                  if (ticketsModel.isPackUp)
                    Text('pack up', style: TextStyle(color: Colors.green)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
