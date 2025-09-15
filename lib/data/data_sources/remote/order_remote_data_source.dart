import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/order/add_to_cart_model.dart';
import 'package:e_commerce_app/data/models/order/order_registration_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderRemoteDataSource {
  Future<Either> addToCart(AddToCartModel addToCart);
  Future<Either> getCartProducts();
  Future<Either> removeCartProduct(String id);
  Future<Either> orderRegistration(OrderRegistrationModel orderRegistration);
  Future<Either> getOrders();
}

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  @override
  Future<Either> addToCart(AddToCartModel addToCart) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .add(addToCart.toMap());

      return const Right('Add to cart was successful');
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getCartProducts() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final returnedData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .get();

      List<Map> products = [];
      for (var item in returnedData.docs) {
        var data = item.data();
        data.addAll({'id': item.id});
        products.add(data);
      }
      return Right(products);
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getOrders() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final returnedData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Orders')
          .get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> orderRegistration(
    OrderRegistrationModel orderRegistration,
  ) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Orders')
          .add(orderRegistration.toMap());

      for (var item in orderRegistration.products) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .collection('Cart')
            .doc(item.id)
            .delete();
      }
      return const Right('Order registered successfully');
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .doc(id)
          .delete();

      return const Right('Product was removed successfully');
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
