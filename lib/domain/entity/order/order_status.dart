import 'package:cloud_firestore/cloud_firestore.dart';

class OrderStatus {
  final String title;
  final bool done;
  final Timestamp createdDate;

  OrderStatus({
    required this.title,
    required this.done,
    required this.createdDate,
  });
}
