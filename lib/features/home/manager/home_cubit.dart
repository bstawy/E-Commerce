import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:injectable/injectable.dart';

import '../../../domain/entities/home/brand_entity.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/use_case/brands_use_case.dart';
import '../../../domain/use_case/categories_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  CategoriesUseCase getCategoriesUseCase;
  BrandsUseCase getBrandsUseCase;

  @factoryMethod
  HomeCubit(this.getCategoriesUseCase, this.getBrandsUseCase)
      : super(InitialState());

  void getCategories() async {
    emit(LoadingState());
    try {
      var categories = await getCategoriesUseCase.execute();
      var brands = await getBrandsUseCase.execute();
      emit(SuccessState(categories, brands));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
