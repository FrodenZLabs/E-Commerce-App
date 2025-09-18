import 'package:e_commerce_app/data/models/order/add_to_cart_model.dart';
import 'package:e_commerce_app/domain/usecases/order/add_to_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'add_to_cart_state.dart';

@injectable
class AddToCartCubit extends Cubit<AddToCartState> {
  final AddToCartUseCase _addToCartUseCase;

  AddToCartCubit(this._addToCartUseCase) : super(AddToCartInitial());

  Future<void> addToCart(AddToCartModel model) async {
    emit(AddToCartLoading());

    final result = await _addToCartUseCase(params: model);

    result.fold(
      (error) => emit(AddToCartError(error.toString())),
      (success) => emit(AddToCartSuccess()),
    );
  }
}
