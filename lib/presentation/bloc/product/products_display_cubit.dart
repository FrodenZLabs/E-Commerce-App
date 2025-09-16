import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'products_display_state.dart';

@injectable
class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;
  ProductsDisplayCubit(this.useCase) : super(ProductsDisplayInitial());

  void displayProducts({dynamic params}) async {
    emit(ProductsDisplayLoading());

    final returnedData = await useCase.call(params: params);
    returnedData.fold(
      (error) {
        emit(LoadProductsFailure());
      },
      (data) {
        emit(ProductsLoaded(data));
      },
    );
  }

  void displayInitial() {
    emit(ProductsDisplayInitial());
  }
}
