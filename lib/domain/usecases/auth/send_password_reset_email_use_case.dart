import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SendPasswordResetEmailUseCase implements UseCase<Either, String> {
  final AuthRepository repository;

  SendPasswordResetEmailUseCase(this.repository);

  @override
  Future<Either> call({String? params}) async {
    return await repository.sendPasswordResetEmail(params!);
  }
}
