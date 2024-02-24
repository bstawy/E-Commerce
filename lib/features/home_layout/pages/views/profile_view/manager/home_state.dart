part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class InitialState extends HomeStates {}

class LoadingState extends HomeStates {}

class SuccessState extends HomeStates {
  final List<Category>? categories;
  final List<Brand>? brands;
  final List<Product>? products;

  SuccessState(this.categories, this.brands, this.products);
}

class ErrorState extends HomeStates {
  final String? message;

  ErrorState(this.message);
}
