import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/product/product_model.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class ProductRemoteDataSource {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future<Either> addOrRemoveFavoriteProduct(Product product);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoritesProducts();
}

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<Either> addOrRemoveFavoriteProduct(Product product) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final products = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: product.productId)
          .get();

      if (products.docs.isNotEmpty) {
        await products.docs.first.reference.delete();
        return const Right(false);
      } else {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .collection('Favorites')
            .add(product.fromEntity().toMap());

        return const Right(true);
      }
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getFavoritesProducts() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final returnedData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorites')
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('createdDate', isGreaterThanOrEqualTo: DateTime(2024, 07, 25))
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getProductsByTitle(String title) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('title', isGreaterThanOrEqualTo: title)
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('salesNumber', isGreaterThanOrEqualTo: 20)
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<bool> isFavorite(String productId) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final products = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: productId)
          .get();

      if (products.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
