import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/repository/auth/auth_repository.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {
  final AuthRepository repository;

  GetUserUseCase(this.repository);

  @override
  Future<Either> call({params}) async {
    return await repository.getUser();
  }
}
