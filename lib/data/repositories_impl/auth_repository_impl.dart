import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce_app/data/models/auth/user_creation_model.dart';
import 'package:e_commerce_app/data/models/auth/user_model.dart';
import 'package:e_commerce_app/data/models/auth/user_signin_model.dart';
import 'package:e_commerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either> getAges() async {
    return await remoteDataSource.getAges();
  }

  @override
  Future<Either> getUser() async {
    final user = await remoteDataSource.getUser();
    return user.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(UserModel.fromMap(data).toEntity());
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    return await remoteDataSource.isLoggedIn();
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await remoteDataSource.sendPasswordResetEmail(email);
  }

  @override
  Future<Either> signIn(UserSignInModel user) async {
    return await remoteDataSource.signIn(user);
  }

  @override
  Future<Either> signUp(UserCreationModel user) async {
    return await remoteDataSource.signUp(user);
  }
}
