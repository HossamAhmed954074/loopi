import '../../../cubits/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/loading_indecator_custom_widget.dart';
import '../widgets/payment_list_view_body.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PaymentCubit>(context).fetchPaymentMethods();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Methods',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoading) {
            return LoadingIndecatorCustomWidget();
          } else if (state is PaymentSuccess) {
            return PaymentBody(paymentModel: state.paymentModel);
          } else {
            return Center(child: Text('Error , Try again Later! '));
          }
        },
      ),
    );
  }
}




