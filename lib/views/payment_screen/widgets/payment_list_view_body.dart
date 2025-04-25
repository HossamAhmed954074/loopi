import 'package:flutter/material.dart';

import '../../../constants/routs_constants.dart';
import '../../../models/payment_model/payment_model.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({super.key, required this.paymentModel});
  final PaymentModel paymentModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: paymentModel.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  paymentRequistBodyScreen,
                  arguments: 'https://staging.fawaterk.com/link/I0PAH',
                );
              },
              title: Text(paymentModel.data![index].nameEn!),
              subtitle: Text(paymentModel.data![index].nameAr!),
              leading: Image.network(paymentModel.data![index].logo!),
            ),
          );
        },
      ),
    );
  }
}