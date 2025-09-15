import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/domain/entity/order/order_status.dart';

class OrderStatusModel {
  final String title;
  final bool done;
  final Timestamp createdDate;

  OrderStatusModel({
    required this.title,
    required this.done,
    required this.createdDate,
  });

  factory OrderStatusModel.fromMap(Map<String, dynamic> map) {
    return OrderStatusModel(
      title: map['title'] as String,
      done: map['done'] as bool,
      createdDate: map['createdDate'] as Timestamp,
    );
  }
}

extension OrderStatusXModel on OrderStatusModel {
  OrderStatus toEntity() {
    return OrderStatus(title: title, done: done, createdDate: createdDate);
  }
}
