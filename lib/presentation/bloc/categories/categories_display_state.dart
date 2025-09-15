part of 'categories_display_cubit.dart';

abstract class CategoriesDisplayState {}

class CategoriesDisplayLoading extends CategoriesDisplayState {}

class CategoriesLoaded extends CategoriesDisplayState {
  final List<Category> categories;

  CategoriesLoaded({required this.categories});
}

class LoadCategoriesFailure extends CategoriesDisplayState {}
