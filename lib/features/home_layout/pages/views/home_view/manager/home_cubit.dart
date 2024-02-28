import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:injectable/injectable.dart';

import '../../../../../../domain/entities/home/brand_entity.dart';
import '../../../../../../domain/entities/home/category_entity.dart';
import '../../../../../../domain/entities/home/product_entity.dart';
import '../../../../../../domain/use_case/brands_use_case.dart';
import '../../../../../../domain/use_case/categories_use_case.dart';
import '../../../../../../domain/use_case/products_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  CategoriesUseCase getCategoriesUseCase;
  BrandsUseCase getBrandsUseCase;
  ProductsUseCase getMostSellingProducts;

  @factoryMethod
  HomeCubit(
    this.getCategoriesUseCase,
    this.getBrandsUseCase,
    this.getMostSellingProducts,
  ) : super(LoadingState());

  void getCategories() async {
    emit(LoadingState());
    try {
      var categories = await getCategoriesUseCase.execute();
      var brands = await getBrandsUseCase.execute();
      var products = await getMostSellingProducts.execute();

      emit(SuccessState(
        categories: categories,
        brands: brands,
        products: products,
      ));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
