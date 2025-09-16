import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/repository/category/category_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCategoriesUseCase implements UseCase<Either, dynamic> {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either> call({params}) async {
    return await repository.getCategories();
  }
}
