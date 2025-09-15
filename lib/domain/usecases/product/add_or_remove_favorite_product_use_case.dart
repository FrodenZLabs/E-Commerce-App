import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:e_commerce_app/domain/repository/product/product_repository.dart';

class AddOrRemoveFavoriteProductUseCase implements UseCase<Either, Product> {
  final ProductRepository repository;

  AddOrRemoveFavoriteProductUseCase(this.repository);

  @override
  Future<Either> call({Product? params}) async {
    return await repository.addOrRemoveFavoriteProduct(params!);
  }
}
