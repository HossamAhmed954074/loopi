import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../apis/firebase_api/firebase_api.dart';
import '../../models/message_model/message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  FireBaseApi fireBaseApi = FireBaseApi();

  getDate({required String auth}) {
    final CollectionReference messages = FirebaseFirestore.instance
        .collection('users')
        .doc(auth)
        .collection('messages');


    messages.orderBy('kCreatedAt',descending: true).snapshots().listen((event) {
      List<MessageModel> list=[];
      for(var doc in event.docs){
        list.add(MessageModel.fromJson(doc));
      }
      emit(ChatSuccess(messageList: list));
    },);
  }

  postMessageData({required String message, required String auth}) {
    final CollectionReference messages = FirebaseFirestore.instance
        .collection('users')
        .doc(auth)
        .collection('messages');
    messages.add({
      'kMessage': message,
      'kCreatedAt': DateTime.now().toString(),
      'Id': auth,
    });
  }
}
