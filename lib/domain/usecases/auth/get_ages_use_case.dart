import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/repository/auth/auth_repository.dart';

class GetAgesUseCase implements UseCase<Either, dynamic> {
  final AuthRepository repository;

  GetAgesUseCase(this.repository);

  @override
  Future<Either> call({params}) async {
    return await repository.getAges();
  }
}
