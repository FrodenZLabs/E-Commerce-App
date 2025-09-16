import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/repository/product/product_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class IsFavoriteUseCase implements UseCase<bool, String> {
  final ProductRepository repository;

  IsFavoriteUseCase(this.repository);

  @override
  Future<bool> call({String? params}) async {
    return await repository.isFavorite(params!);
  }
}
