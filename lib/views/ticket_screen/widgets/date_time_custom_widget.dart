import 'package:final_project/cubits/ticket_cubit/cubit/ticket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;

class DateTimeCustomWidget extends StatelessWidget {
  const DateTimeCustomWidget({super.key, required this.onConfirm});
  final Function(DateTime) onConfirm;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketCubit, TicketState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () {
            picker.DatePicker.showDateTimePicker(
              context,
              showTitleActions: true,
              minTime: DateTime(2025, 5, 5, 20, 50),
              maxTime: DateTime(2026, 6, 7, 05, 09),
              onChanged: (date) {},
              onCancel:
                  () => BlocProvider.of<TicketCubit>(context).cancelDateTime(),
              onConfirm: onConfirm,
              locale: picker.LocaleType.en,
            );
          },
          child:
              state is DateTimeSuccess
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${state.dateTime.day} / ${state.dateTime.month}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${state.dateTime.hour} : ${state.dateTime.minute} AM',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.date_range_outlined, color: Colors.white),
                      SizedBox(width: 4),
                      Text('DateTime', style: TextStyle(color: Colors.white)),
                    ],
                  ),
        );
      },
    );
  }
}