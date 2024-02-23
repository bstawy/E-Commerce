part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class InitialState extends HomeStates {}

class LoadingState extends HomeStates {}

class SuccessState extends HomeStates {
  final List<Category>? categories;
  final List<Brand>? brands;

  SuccessState(this.categories, this.brands);
}

class ErrorState extends HomeStates {
  final String? message;

  ErrorState(this.message);
}
