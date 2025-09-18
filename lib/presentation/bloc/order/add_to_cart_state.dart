part of 'add_to_cart_cubit.dart';

abstract class AddToCartState {}

class AddToCartInitial extends AddToCartState {}

class AddToCartLoading extends AddToCartState {}

class AddToCartSuccess extends AddToCartState {}

class AddToCartError extends AddToCartState {
  final String message;
  AddToCartError(this.message);
}
