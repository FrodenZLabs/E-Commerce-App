import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/repository/order/order_repository.dart';

class GetCartProductsUseCase implements UseCase<Either, dynamic> {
  final OrderRepository repository;
  GetCartProductsUseCase(this.repository);

  @override
  Future<Either> call({params}) async {
    return await repository.getCartProducts();
  }
}
