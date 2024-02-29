import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/data_services/local_storage/local_token_manager.dart';
import '../../../../../../core/error/server_failure.dart';
import '../../../../../../domain/entities/home/product_entity.dart';
import '../../../../../../domain/use_case/wish_list_use_case.dart';

part 'wish_list_state.dart';

@injectable
class WishListCubit extends Cubit<WishListState> {
  LocalTokenManager localTokenManager;
  WishListUseCase wishListUseCase;

  @factoryMethod
  WishListCubit(this.localTokenManager, this.wishListUseCase)
      : super(InitialState());

  Future<void> checkLogging() async {
    emit(InitialState());

    String? storedToken = await localTokenManager.getToken();

    if (storedToken != null) {
      getWishList();
    } else {
      emit(UnLoggedUserState());
    }
  }

  void getWishList() async {
    emit(LoadingState());

    var response = await wishListUseCase.execute();
    response.fold(
      (l) {
        emit(FailureState(l));
      },
      (r) {
        emit(SuccessState(r!.data!));
      },
    );
  }
}
