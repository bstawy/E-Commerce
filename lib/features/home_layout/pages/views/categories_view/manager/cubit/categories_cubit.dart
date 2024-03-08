import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/error/server_failure.dart';
import '../../../../../../../domain/entities/home/category_entity.dart';
import '../../../../../../../domain/use_case/categories_use_case.dart';
import '../../../../../../../domain/use_case/sub_categories_on_category_use_case.dart';

part 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesUseCase getCategoriesUseCase;
  SubCategoriesOnCategoryUseCase getSubCategoriesOnCategoryUseCase;

  List<Category>? categories;
  List<Category>? subCategories;
  int selectedCategoryIndex = 0;

  @factoryMethod
  CategoriesCubit(
      this.getCategoriesUseCase, this.getSubCategoriesOnCategoryUseCase)
      : super(InitialState());

  void changeCategory(int index) {
    selectedCategoryIndex = index;
    getSubCategoriesOnCategory(categories![index].id!);
  }

  void getCategories() async {
    emit(LoadingState());

    var response = await getCategoriesUseCase.execute();
    response.fold(
      (l) {
        emit(FailureState(l));
      },
      (r) {
        categories = r;
        emit(SuccessState());
        getSubCategoriesOnCategory(r![0].id!);
      },
    );
  }

  void getSubCategoriesOnCategory(String categoryId) async {
    emit(SubCategoriesLoadingState());

    var response = await getSubCategoriesOnCategoryUseCase.execute(categoryId);
    response.fold(
      (l) {
        emit(FailureState(l));
      },
      (r) {
        subCategories = r;
        emit(SubCategoriesLoadedState());
      },
    );
  }
}
