import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class CategoryRemoteDataSource {
  Future<Either> getCategories();
}

@LazySingleton(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<Either> getCategories() async {
    try {
      final categories = await FirebaseFirestore.instance
          .collection('Categories')
          .get();
      return Right(categories.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
