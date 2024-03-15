part of 'wish_list_cubit.dart';

@immutable
abstract class WishListState {}

class InitialState extends WishListState {}

class UnLoggedUserState extends WishListState {}

class LoadingState extends WishListState {}

class SuccessState extends WishListState {
  final List<Product> wishList;

  SuccessState(this.wishList);
}

class EmptyState extends WishListState {}

class FailureState extends WishListState {
  final ServerFailure serverFailure;

  FailureState(this.serverFailure);
}
