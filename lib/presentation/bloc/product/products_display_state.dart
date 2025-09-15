part of 'products_display_cubit.dart';

abstract class ProductsDisplayState {}

final class ProductsDisplayInitial extends ProductsDisplayState {}

final class ProductsDisplayLoading extends ProductsDisplayState {}

final class ProductsLoaded extends ProductsDisplayState {
  final List<Product> products;

  ProductsLoaded(this.products);
}

final class LoadProductsFailure extends ProductsDisplayState {}
