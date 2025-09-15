import 'package:e_commerce_app/domain/entity/category/category.dart';
import 'package:e_commerce_app/domain/usecases/category/get_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_display_state.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  CategoriesDisplayCubit(this._getCategoriesUseCase)
    : super(CategoriesDisplayLoading());

  void displayCategories() async {
    final returnedData = await _getCategoriesUseCase();
    returnedData.fold(
      (error) {
        emit(LoadCategoriesFailure());
      },
      (data) {
        emit(CategoriesLoaded(categories: data));
      },
    );
  }
}
