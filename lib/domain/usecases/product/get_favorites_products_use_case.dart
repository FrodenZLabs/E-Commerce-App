import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/repository/product/product_repository.dart';

class GetFavoritesProductsUseCase implements UseCase<Either, dynamic> {
  final ProductRepository repository;

  GetFavoritesProductsUseCase(this.repository);

  @override
  Future<Either> call({params}) async {
    return await repository.getFavoritesProducts();
  }
}
