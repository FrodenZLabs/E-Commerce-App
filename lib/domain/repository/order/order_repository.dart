import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/order/add_to_cart_model.dart';
import 'package:e_commerce_app/data/models/order/order_registration_model.dart';

abstract class OrderRepository {
  Future<Either> addToCart(AddToCartModel addToCartModel);
  Future<Either> getCartProducts();
  Future<Either> removeCartProduct(String id);
  Future<Either> orderRegistration(OrderRegistrationModel order);
  Future<Either> getOrders();
}
