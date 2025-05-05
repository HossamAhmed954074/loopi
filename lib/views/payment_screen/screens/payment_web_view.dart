import '../../../constants/routs_constants.dart';
import '../../../cubits/payment_cubit/payment_cubit.dart';
import '../../login_register_screens/widgets/snackBarCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/loading_indecator_custom_widget.dart';

class PaymentRequistBodyScreen extends StatelessWidget {
  const PaymentRequistBodyScreen({super.key});
@override
  Widget build(BuildContext context) {
    BlocProvider.of<PaymentCubit>(
      context,
    ).processPaymentRequest(paymentId: 2, price: '400');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:
              () => Navigator.pushReplacementNamed(context, paymentsScreen),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Payment Process',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          if (state is PaymentRequistSuccess) {
            var controller =
                WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onProgress: (int progress) {
                        // Update loading bar.
                      },
                      onPageStarted: (String url) {},
                      onPageFinished: (String url) {},
                      onHttpError: (HttpResponseError error) {},
                      onWebResourceError: (WebResourceError error) {},
                      onNavigationRequest: (NavigationRequest request) {
                        if (request.url.contains('success')) {
                          snackBarCustom(context, 'payment Success');
                          Navigator.pushReplacementNamed(context, tiketScreen,arguments: true);
                        } else if (request.url.contains('fail')) {
                          snackBarCustom(context, 'Faild Payment Try again !');
                          Navigator.pushReplacementNamed(
                            context,
                            tiketScreen,
                            arguments: false,
                          );
                        }
                        return NavigationDecision.navigate;
                      },
                    ),
                  )
                  ..loadRequest(
                    Uri.parse(
                      state.paymentVisaModel.data!.paymentData!.redirectTo!,
                    ),
                  );
            return WebViewWidget(controller: controller);
          } else if (state is PaymentRequistLoading) {
            return LoadingIndecatorCustomWidget();
          } else {
            return Center(child: Text('Have Error'));
          }
        },
      ),
    );
  }
}
