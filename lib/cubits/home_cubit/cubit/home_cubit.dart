import 'package:bloc/bloc.dart';
import '../../../apis/firebase_api/firebase_api.dart';
import '../../../models/ticket_model/ticket_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getData() async {
    emit(HomeLoaded());
    try {
      List<TicketsModel> userData = [];
      var data = FireBaseApi().getAllData();      
      var list = await data;
      for (int i = 0; i < list.docs.length; i++) {
        userData.add(TicketsModel.fromSnapShot(list.docs[i].data()));
      }
      emit(Homesucess(ticketModel: userData));
    } catch (e) {
      emit(HomeFaluire(errorMessage: e.toString()));
    }
  }
}
