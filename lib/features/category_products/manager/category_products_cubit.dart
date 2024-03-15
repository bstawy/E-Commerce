import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../../domain/use_case/get_category_products_use_case.dart';

part 'category_products_state.dart';

@injectable
class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final GetCategoryProductsUseCase _getSubCategoriesOnCategoryUseCase;

  @factoryMethod
  CategoryProductsCubit(this._getSubCategoriesOnCategoryUseCase)
      : super(InitialState());

  getProducts(String categoryId) async {
    var response = await _getSubCategoriesOnCategoryUseCase.execute(categoryId);

    response.fold((l) {
      emit(FailureState(l));
    }, (r) {
      if (r!.isEmpty) {
        emit(EmptyState());
      } else {
        emit(SuccesState(r));
      }
    });
  }
}
