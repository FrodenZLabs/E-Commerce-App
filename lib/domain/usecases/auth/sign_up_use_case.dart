import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/models/auth/user_creation_model.dart';
import 'package:e_commerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SignUpUseCase implements UseCase<Either, UserCreationModel> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either> call({UserCreationModel? params}) async {
    return await repository.signUp(params!);
  }
}
