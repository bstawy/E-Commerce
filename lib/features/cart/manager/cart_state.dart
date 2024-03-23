part of 'cart_cubit.dart';

abstract class CartState {}

final class InitialState extends CartState {}

final class UnLoggedUserState extends CartState {}

final class LoadingState extends CartState {}

final class SuccessState extends CartState {
  final CartData data;
  SuccessState(this.data);
}

final class AddToCartSuccessState extends CartState {
  final String message;
  AddToCartSuccessState(this.message);
}

final class FailureState extends CartState {
  final ServerFailure serverFailure;

  FailureState(this.serverFailure);
}
