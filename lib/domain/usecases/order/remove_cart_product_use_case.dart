import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/repository/order/order_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RemoveCartProductUseCase implements UseCase<Either, String> {
  final OrderRepository repository;

  RemoveCartProductUseCase(this.repository);

  @override
  Future<Either> call({String? params}) async {
    return await repository.removeCartProduct(params!);
  }
}
