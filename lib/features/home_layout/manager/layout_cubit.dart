import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../pages/views/home_view/pages/home_view.dart';

part 'layout_state.dart';

@injectable
class LayoutCubit extends Cubit<LayoutState> {
  @factoryMethod
  LayoutCubit() : super(HomeTabState());

  void onTap(int index) {
    switch (index) {
      case 0:
        emit(HomeTabState());
        return;
      case 1:
        emit(CategoriesTabState());
        return;
      case 2:
        emit(FavoritesTabState());
        return;
      case 3:
        emit(ProfileTabState());
        return;
      default:
        emit(HomeTabState());
    }
  }
}
