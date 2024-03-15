import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/error/server_failure.dart';
import '../../../../../../../domain/entities/home/sub_category_entity.dart';
import '../../../../../../../domain/use_case/get_sub_categories_on_category_use_case.dart';

part 'sub_categories_state.dart';

@injectable
class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  final GetSubCategoriesOnCategoryUseCase _getSubCategoriesOnCategoryUseCase;

  @factoryMethod
  SubCategoriesCubit(this._getSubCategoriesOnCategoryUseCase)
      : super(SubCategoriesInitialState());

  void getSubCategoriesOnCategory(String categoryId) async {
    emit(SubCategoriesLoadingState());

    var response = await _getSubCategoriesOnCategoryUseCase.execute(categoryId);
    response.fold(
      (l) {
        emit(SubCategoriesFailureState(l));
      },
      (r) {
        debugPrint(
            "============= Sub Categories cubit =============\n${r.toString()}");
        emit(SubCategoriesSuccessState(r!));
      },
    );
  }
}
