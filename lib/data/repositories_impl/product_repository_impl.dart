import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote/product_remote_data_source.dart';
import 'package:e_commerce_app/data/models/product/product_model.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:e_commerce_app/domain/repository/product/product_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either> addOrRemoveFavoriteProduct(Product product) async {
    var returnedData = await remoteDataSource.addOrRemoveFavoriteProduct(
      product,
    );
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }

  @override
  Future<Either> getFavoritesProducts() async {
    var returnedData = await remoteDataSource.getFavoritesProducts();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> getNewIn() async {
    var returnedData = await remoteDataSource.getNewIn();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    var returnedData = await remoteDataSource.getProductsByCategoryId(
      categoryId,
    );
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> getProductsByTitle(String title) async {
    var returnedData = await remoteDataSource.getProductsByTitle(title);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> getTopSelling() async {
    final returnedData = await remoteDataSource.getTopSelling();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<bool> isFavorite(String productId) async {
    return await remoteDataSource.isFavorite(productId);
  }
}
