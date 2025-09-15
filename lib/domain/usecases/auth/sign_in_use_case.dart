import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/models/auth/user_signin_model.dart';
import 'package:e_commerce_app/domain/repository/auth/auth_repository.dart';

class SignInUseCase implements UseCase<Either, UserSignInModel> {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<Either> call({UserSignInModel? params}) async {
    return await repository.signIn(params!);
  }
}
