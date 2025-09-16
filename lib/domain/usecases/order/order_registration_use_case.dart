import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/models/order/order_registration_model.dart';
import 'package:e_commerce_app/domain/repository/order/order_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class OrderRegistrationUseCase
    implements UseCase<Either, OrderRegistrationModel> {
  final OrderRepository repository;

  OrderRegistrationUseCase(this.repository);

  @override
  Future<Either> call({OrderRegistrationModel? params}) async {
    return await repository.orderRegistration(params!);
  }
}
