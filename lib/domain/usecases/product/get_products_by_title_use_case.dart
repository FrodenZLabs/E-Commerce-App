import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/repository/product/product_repository.dart';

class GetProductsByTitleUseCase implements UseCase<Either, String> {
  final ProductRepository repository;

  GetProductsByTitleUseCase(this.repository);

  @override
  Future<Either> call({String? params}) async {
    return await repository.getProductsByTitle(params!);
  }
}
