part of 'sub_categories_cubit.dart';

abstract class SubCategoriesState {}

final class SubCategoriesInitialState extends SubCategoriesState {}

final class SubCategoriesLoadingState extends SubCategoriesState {}

final class SubCategoriesSuccessState extends SubCategoriesState {
  final List<SubCategory> subCategories;
  SubCategoriesSuccessState(this.subCategories);
}

final class SubCategoriesFailureState extends SubCategoriesState {
  final ServerFailure serverFailure;
  SubCategoriesFailureState(this.serverFailure);
}
