import 'package:cloud_firestore/cloud_firestore.dart';

class TicketsModel {
  final Timestamp dateTime;
  final GeoPoint startPoint;
  final GeoPoint endPoint;
  final num price;
  final String startLocation;
  final String endLocation;
  final bool isArrived;

  TicketsModel({
    required this.startPoint,
    required this.endPoint,
    required this.dateTime,
    required this.startLocation,
    required this.endLocation,
    required this.price,
  required this.isArrived,
});

  factory TicketsModel.fromSnapShot(Map<String, dynamic> doc) {
    final data = doc;
    return TicketsModel(
      startPoint: data['startPoint'],
      endPoint: data['endPoint'],
      dateTime: data['dateTime'],
      startLocation: data['startLocation'],
      endLocation: data['endLocation'],
      price: data['price'],
      isArrived: data['isArrived'],

    );
  }
}
