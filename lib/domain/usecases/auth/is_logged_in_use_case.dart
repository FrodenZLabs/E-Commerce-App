import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  final AuthRepository repository;

  IsLoggedInUseCase(this.repository);

  @override
  Future<bool> call({params}) async {
    return await repository.isLoggedIn();
  }
}
