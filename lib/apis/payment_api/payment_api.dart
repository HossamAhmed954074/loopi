import 'package:dio/dio.dart';
import 'package:final_project/models/payment_model/payment_model.dart';
import '../../models/payment_model/payment_visa_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PaymentApi {
  late Dio dio;
  String? apiUrl = 'https://staging.fawaterk.com/api/v2/getPaymentmethods';
  String? apiUrlPost = 'https://staging.fawaterk.com/api/v2/invoiceInitPay';
  String? accessToken = 'd83a5d07aaeb8442dcbe259e6dae80a3f2e21a3a581e1a5acd';

  PaymentApi() {
    var opthins = BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    dio = Dio(opthins);
  }

  Future<PaymentModel> fetchPaymentMethods() async {
    try {
      final response = await dio.get(apiUrl!);
      return PaymentModel.fromJson(response.data);
    } catch (error) {
      return Future.error(
        '**** Payment error : ',
        StackTrace.fromString('this is its trace ${error.toString()}'),
      );
    }
  }

  Future<PaymentVisaModel> processPaymentRequest() async {
    final apiUrl = 'https://staging.fawaterk.com/api/v2/invoiceInitPay';
    final apiToken = 'd83a5d07aaeb8442dcbe259e6dae80a3f2e21a3a581e1a5acd';
    final paymentId = 2; // 2=Visa-MasterCard, 3=Fawry, 4=Meeza

    final requestData = {
      'payment_method_id': paymentId,
      'cartTotal': '100',
      'currency': 'EGP',
      'customer': {
        'first_name': 'test',
        'last_name': 'test',
        'email': 'test@test.test',
        'phone': '01000000000',
        'address': 'test address',
      },
      'redirectionUrls': {
        'successUrl': 'https://dev.fawaterk.com/success',
        'failUrl': 'https://dev.fawaterk.com/fail',
        'pendingUrl': 'https://dev.fawaterk.com/pending',
      },
      'cartItems': [
        {
          'name': 'test',
          'price': '100',
          'quantity': '1',
        },
      ],
    };
    final headers = {
      'Authorization': 'Bearer $apiToken',
      'Content-Type': 'application/json',
    };
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(requestData),
      );
      return PaymentVisaModel.fromJson(json.decode(response.body));
    } catch (error) {
      return Future.error(
        '**** Payment error : ',
        StackTrace.fromString('this is its trace ${error.toString()}'),
      );
    }
  }
}
