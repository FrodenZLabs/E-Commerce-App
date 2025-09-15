import 'package:e_commerce_app/domain/entity/order/order.dart';
import 'package:e_commerce_app/domain/usecases/order/get_orders_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_display_state.dart';

class OrdersDisplayCubit extends Cubit<OrdersDisplayState> {
  final GetOrdersUseCase _ordersUseCase;
  OrdersDisplayCubit(this._ordersUseCase) : super(OrdersLoading());

  void displayOrders() async {
    var returnedData = await _ordersUseCase();
    returnedData.fold(
      (error) {
        emit(LoadOrdersFailure(errorMessage: error));
      },
      (orders) {
        emit(OrdersLoaded(orders: orders));
      },
    );
  }
}
