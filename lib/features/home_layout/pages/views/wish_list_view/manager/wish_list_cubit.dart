import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/data_services/local_storage/local_token_manager.dart';
import '../../../../../../core/error/server_failure.dart';
import '../../../../../../core/services/loading_service.dart';
import '../../../../../../domain/entities/home/product_entity.dart';
import '../../../../../../domain/use_case/add_product_to_wish_list_use_case.dart';
import '../../../../../../domain/use_case/remove_product_from_wish_list_use_case.dart';
import '../../../../../../domain/use_case/get_wish_list_use_case.dart';

part 'wish_list_state.dart';

@injectable
class WishListCubit extends Cubit<WishListState> {
  final LocalTokenManager _localTokenManager;
  final GetWishListUseCase _wishListUseCase;
  final RemoveProductFromWishListUseCase _removeFromWishListUseCase;
  final AddProductToWishListUseCase _addProductToWishListUseCase;

  List<String?> wishListProductIds = [];

  @factoryMethod
  WishListCubit(
    this._localTokenManager,
    this._wishListUseCase,
    this._removeFromWishListUseCase,
    this._addProductToWishListUseCase,
  ) : super(InitialState());

  Future<void> checkLogging() async {
    emit(LoadingState());

    String? storedToken = await _localTokenManager.getToken();

    if (storedToken != null) {
      getWishList();
    } else {
      emit(UnLoggedUserState());
    }
  }

  void getWishList() async {
    emit(LoadingState());

    var response = await _wishListUseCase.execute();
    response.fold(
      (l) {
        emit(FailureState(l));
      },
      (r) {
        wishListProductIds = r!.data!.map((product) => product.id).toList();
        emit(SuccessState(r.data!));
      },
    );
  }

  void removeProductFromWishList(String productId) async {
    emit(LoadingState());

    configureEasyLoading();
    EasyLoading.show();

    var response = await _removeFromWishListUseCase.execute(productId);

    EasyLoading.dismiss();

    response.fold(
      (l) {
        emit(FailureState(l));
      },
      (r) {
        getWishList();
      },
    );
  }

  void addProductToWishList(String productId) async {
    emit(LoadingState());

    configureEasyLoading();
    EasyLoading.show();

    var response = await _addProductToWishListUseCase.execute(productId);

    EasyLoading.dismiss();

    response.fold(
      (l) {
        emit(FailureState(l));
      },
      (r) {
        getWishList();
      },
    );
  }
}
