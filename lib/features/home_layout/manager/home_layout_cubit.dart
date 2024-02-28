import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../pages/views/categories_view/pages/categories_view.dart';
import '../pages/views/home_view/pages/home_view.dart';
import '../pages/views/profile_view/pages/profile_view.dart';
import '../pages/views/wish_list_view/pages/wish_list_view.dart';

part 'home_layout_state.dart';

@injectable
class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  @factoryMethod
  HomeLayoutCubit() : super(HomeTabState());

  void onTap(int index) {
    switch (index) {
      case 0:
        emit(HomeTabState());
        return;
      case 1:
        emit(CategoriesTabState());
        return;
      case 2:
        emit(WishListTabState());
        return;
      case 3:
        emit(ProfileTabState());
        return;
      default:
        emit(HomeTabState());
    }
  }
}
