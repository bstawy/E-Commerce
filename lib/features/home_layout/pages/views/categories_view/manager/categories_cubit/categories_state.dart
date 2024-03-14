part of 'categories_cubit.dart';

abstract class CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class ChangeCategoryState extends CategoriesState {
  int selectedCategoryIndex;
  ChangeCategoryState(this.selectedCategoryIndex);
}

class CategoriesSuccessState extends CategoriesState {
  List<Category> categories;
  CategoriesSuccessState(this.categories);
}

class CategoriesFailureState extends CategoriesState {
  ServerFailure? serverFailure;

  CategoriesFailureState(this.serverFailure);
}
