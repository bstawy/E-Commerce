import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/error/server_failure.dart';
import '../../../../../../../domain/entities/home/category_entity.dart';
import '../../../../../../../domain/use_case/get_categories_use_case.dart';

part 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  @factoryMethod
  CategoriesCubit(this._getCategoriesUseCase) : super(CategoriesLoadingState());

  int selectedCategoryIndex = 0;
  List<Category>? categories;

  void changeCategory(int index) {
    selectedCategoryIndex = index;
    emit(ChangeCategoryState(index));
  }

  void getCategories() async {
    emit(CategoriesLoadingState());

    var response = await _getCategoriesUseCase.execute();
    response.fold(
      (l) {
        emit(CategoriesFailureState(l));
      },
      (r) {
        categories = r!;
        emit(CategoriesSuccessState(r));
      },
    );
  }
}
