import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:e_commerce_app/domain/usecases/product/add_or_remove_favorite_product_use_case.dart';
import 'package:e_commerce_app/domain/usecases/product/is_favorite_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteIconCubit extends Cubit<bool> {
  final IsFavoriteUseCase _favoriteUseCase;
  final AddOrRemoveFavoriteProductUseCase _addOrRemoveFavoriteProductUseCase;

  FavoriteIconCubit(
    this._favoriteUseCase,
    this._addOrRemoveFavoriteProductUseCase,
  ) : super(false);

  void isFavorite(String productId) async {
    final result = await _favoriteUseCase();

    debugPrint("Result: $result");
    emit(result);
  }

  void onTap(Product product) async {
    final result = await _addOrRemoveFavoriteProductUseCase(params: product);
    result.fold((error) {}, (data) {
      emit(data);
    });
  }
}
