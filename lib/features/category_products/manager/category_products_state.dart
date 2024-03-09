part of 'category_products_cubit.dart';

abstract class CategoryProductsState {}

class InitialState extends CategoryProductsState {}

class LoadingState extends CategoryProductsState {}

class SuccesState extends CategoryProductsState {
  final List<Product> products;
  SuccesState(this.products);
}

class EmptyState extends CategoryProductsState {}

class FailureState extends CategoryProductsState {
  final ServerFailure serverFailure;
  FailureState(this.serverFailure);
}
