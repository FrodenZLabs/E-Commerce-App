import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote/order_remote_data_source.dart';
import 'package:e_commerce_app/data/models/order/add_to_cart_model.dart';
import 'package:e_commerce_app/data/models/order/order_model.dart';
import 'package:e_commerce_app/data/models/order/order_registration_model.dart';
import 'package:e_commerce_app/data/models/order/product_ordered_model.dart';
import 'package:e_commerce_app/domain/repository/order/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either> addToCart(AddToCartModel addToCartModel) {
    return remoteDataSource.addToCart(addToCartModel);
  }

  @override
  Future<Either> getCartProducts() async {
    final returnedData = await remoteDataSource.getCartProducts();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductOrderedModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> getOrders() async {
    final returnedData = await remoteDataSource.getOrders();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data).map((e) => OrderModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationModel order) async {
    final returnedData = await remoteDataSource.orderRegistration(order);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (message) {
        return Right(message);
      },
    );
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    final returnedData = await remoteDataSource.removeCartProduct(id);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (message) {
        return Right(message);
      },
    );
  }
}
