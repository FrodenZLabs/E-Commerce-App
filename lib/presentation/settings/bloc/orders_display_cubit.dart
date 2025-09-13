import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_display_state.dart';

class OrdersDisplayCubit extends Cubit<OrdersDisplayState> {
  OrdersDisplayCubit() : super(OrdersLoading());

  void displayOrders() async {
    var returnedData;
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
