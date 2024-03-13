part of 'categories_cubit.dart';

abstract class CategoriesState {}

class InitialState extends CategoriesState {}

class LoadingState extends CategoriesState {}

class SuccessState extends CategoriesState {}

class SubCategoriesLoadingState extends CategoriesState {}

class SubCategoriesLoadedState extends CategoriesState {
  final List<SubCategory> subCategories;
  SubCategoriesLoadedState(this.subCategories);
}

class FailureState extends CategoriesState {
  ServerFailure? serverFailure;

  FailureState(this.serverFailure);
}
