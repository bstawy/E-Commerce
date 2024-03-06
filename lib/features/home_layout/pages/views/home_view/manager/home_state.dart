part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class LoadingState extends HomeStates {}

class SuccessState extends HomeStates {}

class FailureState extends HomeStates {
  final ServerFailure serverFailure;

  FailureState(this.serverFailure);
}
