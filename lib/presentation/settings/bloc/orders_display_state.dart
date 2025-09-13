part of 'orders_display_cubit.dart';

abstract class OrdersDisplayState {}

class OrdersLoading extends OrdersDisplayState {}

class OrdersLoaded extends OrdersDisplayState {
  final String orders;
  OrdersLoaded({required this.orders});
}

class LoadOrdersFailure extends OrdersDisplayState {
  final String errorMessage;
  LoadOrdersFailure({required this.errorMessage});
}
