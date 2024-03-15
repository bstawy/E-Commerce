import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:injectable/injectable.dart';

import '../../../../../../core/error/server_failure.dart';
import '../../../../../../domain/entities/home/brand_entity.dart';
import '../../../../../../domain/entities/home/category_entity.dart';
import '../../../../../../domain/entities/home/product_entity.dart';
import '../../../../../../domain/use_case/get_brands_use_case.dart';
import '../../../../../../domain/use_case/get_categories_use_case.dart';
import '../../../../../../domain/use_case/get_most_selling_products_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetBrandsUseCase _getBrandsUseCase;
  final GetMostSellingProductsUseCase _getMostSellingProducts;

  List<Category>? categories;
  List<Brand>? brands;
  List<Product>? products;

  @factoryMethod
  HomeCubit(
    this._getCategoriesUseCase,
    this._getBrandsUseCase,
    this._getMostSellingProducts,
  ) : super(LoadingState());

  Future<void> fetchData() async {
    await Future.wait([
      getCategories(),
      getBrands(),
      getProducts(),
    ]);
    emit(SuccessState());
  }

  Future<void> getCategories() async {
    emit(LoadingState());

    var response = await _getCategoriesUseCase.execute();

    response.fold((l) {
      emit(FailureState(l));
    }, (r) {
      categories = r;
    });
  }

  Future<void> getBrands() async {
    emit(LoadingState());

    var response = await _getBrandsUseCase.execute();

    response.fold((l) {
      emit(FailureState(l));
    }, (r) {
      brands = r;
    });
  }

  Future<void> getProducts() async {
    emit(LoadingState());

    var response = await _getMostSellingProducts.execute();

    response.fold((l) {
      emit(FailureState(l));
    }, (r) {
      products = r;
    });
  }
}
