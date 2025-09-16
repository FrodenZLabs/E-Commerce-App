import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote/category_remote_data_source.dart';
import 'package:e_commerce_app/data/models/category/category_model.dart';
import 'package:e_commerce_app/domain/repository/category/category_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either> getCategories() async {
    final categories = await remoteDataSource.getCategories();
    return categories.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => CategoryModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }
}
