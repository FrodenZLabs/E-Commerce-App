import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/models/order/add_to_cart_model.dart';
import 'package:e_commerce_app/domain/repository/order/order_repository.dart';

class AddToCartUseCase implements UseCase<Either, AddToCartModel> {
  final OrderRepository repository;

  AddToCartUseCase(this.repository);

  @override
  Future<Either> call({AddToCartModel? params}) async {
    return await repository.addToCart(params!);
  }
}
