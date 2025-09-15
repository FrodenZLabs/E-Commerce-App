import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';

abstract class ProductRepository {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future<Either> addOrRemoveFavoriteProduct(Product product);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoritesProducts();
}
