import 'package:bloc/bloc.dart';
import 'package:final_project/apis/payment_api/payment_api.dart';
import 'package:final_project/constants/routs_constants.dart';
import 'package:final_project/models/payment_model/payment_model.dart';
import 'package:final_project/models/payment_model/payment_visa_model.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

   fetchPaymentMethods() async{
    emit(PaymentLoading());
    try{
     var paymentModel = await PaymentApi().fetchPaymentMethods();
      emit(PaymentSuccess(paymentModel:  paymentModel));
    }catch (e){
      emit(PaymentFaluire(errorMessage: e.toString()));
    }

  }

  processPaymentRequest({required int paymentId, required String price }) async {
     emit(PaymentRequistLoading());
     try{
       var paymentVisaModel = await PaymentApi().processPaymentRequest();
        emit(PaymentRequistSuccess(paymentVisaModel: paymentVisaModel));
     }catch (e){
       emit(PaymentRequistFaluire(errorMessage: e.toString()));
     }
  }
}
