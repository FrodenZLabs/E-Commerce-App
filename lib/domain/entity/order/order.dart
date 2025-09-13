import 'package:e_commerce_app/domain/entity/order/order_status.dart';
import 'package:e_commerce_app/domain/entity/order/product_ordered.dart';

class Order {
  final List<ProductOrdered> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatus> orderStatus;

  Order({
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.code,
    required this.orderStatus,
  });
}
