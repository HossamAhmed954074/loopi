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

  postData({
    GeoPoint? startPoint,
    GeoPoint? endPoint,
    String? startLocation,
    String? endLocation,
    num? price,
  }) async {
    await _instance.collection('users').doc(authUser).collection('tikets').add({
      'startPoint': startPoint ?? GeoPoint(1.0, 2.0),
      'endPoint': endPoint ?? GeoPoint(3.0, 4.0),
      'dateTime': Timestamp.now(),
      'startLocation': startLocation ?? 'Start Location',
      'endLocation': endLocation ?? 'End Location',
      'price':  price ?? 100,
      'isArrived': false,
      'isPackUp': false,
      'isAccepted': false,
      'id': authUser,
    });
  }
  // postInfoData() async {
  //   await _instance.collection('users').doc(authUser).set({
  //     'startPoint': GeoPoint(1.0, 2.0),
  //     'endPoint': GeoPoint(3.0, 4.0),
  //     'dateTime': Timestamp.now(),
  //     'startLocation': 'Start Location',
  //     'id' : authUser,
  //     'endLocation': 'End Location',
  //     'price': 100,
  //     'isArrived': false,
  //   });
  // }

  deleteData(String tiketId) async {
    await _instance
        .collection('users')
        .doc(authUser)
        .collection('tikets')
        .doc(tiketId)
        .delete();
  }
}
