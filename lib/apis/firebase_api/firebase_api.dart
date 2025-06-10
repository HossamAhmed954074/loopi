import 'package:cloud_firestore/cloud_firestore.dart';

import '../../main.dart';

class FireBaseApi {
  final _instance = FirebaseFirestore.instance;

  Future getAllData() async {
    
    return _instance
        .collection('users')
        .doc(authUser)
        .collection('tikets')
        .orderBy('dateTime', descending: false)
        .get();
  }

  postData() async {
    await _instance.collection('users').doc(authUser).collection('tikets').add({
      'startPoint': GeoPoint(1.0, 2.0),
      'endPoint': GeoPoint(3.0, 4.0),
      'dateTime': Timestamp.now(),
      'startLocation': 'Start Location',
      'endLocation': 'End Location',
      'price': 100,
      'isArrived': false,
    });
  }
  postInfoData() async {
    await _instance.collection('users').doc(authUser).set({
      'startPoint': GeoPoint(1.0, 2.0),
      'endPoint': GeoPoint(3.0, 4.0),
      'dateTime': Timestamp.now(),
      'startLocation': 'Start Location',
      'endLocation': 'End Location',
      'price': 100,
      'isArrived': false,
    });
  }

  deleteData(String tiketId) async {
    await _instance
        .collection('users')
        .doc(authUser)
        .collection('tikets')
        .doc(tiketId)
        .delete();
  }
}
