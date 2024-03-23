import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/cart/cart_data_entity.dart';
import '../../../domain/use_case/add_product_to_cart_use_case.dart';
import '../../../domain/use_case/clear_cart_use_case.dart';
import '../../../domain/use_case/get_cart_products_use_case.dart';
import '../../../domain/use_case/remove_product_from_cart_use_case.dart';
import '../../../domain/use_case/update_cart_product_quantity_use_case.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final GetCartProductsUseCase _getCartProductsUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;
  final RemoveProductFromCartUseCase _removeProductFromCartUseCase;
  final UpdateCartProductQuantityUseCase _updateCartProductQuantityUseCase;
  final ClearCartUseCase _clearCartUseCase;

  @factoryMethod
  CartCubit(
    this._addProductToCartUseCase,
    this._getCartProductsUseCase,
    this._removeProductFromCartUseCase,
    this._updateCartProductQuantityUseCase,
    this._clearCartUseCase,
  ) : super(InitialState());

  void getCartProducts() async {
    emit(LoadingState());

    var response = await _getCartProductsUseCase.execute();

    response.fold(
      (l) {
        if (l.statusCode == "401") {
          emit(UnLoggedUserState());
        } else {
          emit(FailureState(l));
        }
      },
      (r) {
        emit(SuccessState(r));
      },
    );
  }

  void addProductToCart(String productId) async {
    emit(LoadingState());

    var response = await _addProductToCartUseCase.execute(productId);

    response.fold(
      (l) {
        if (l.statusCode == "401") {
          emit(UnLoggedUserState());
        } else {
          emit(FailureState(l));
        }
      },
      (r) {
        emit(AddToCartSuccessState(r));
      },
    );
  }

  void updateCartProductQuantity(String productId, String quantity) async {
    emit(LoadingState());

    var response = await _updateCartProductQuantityUseCase.execute(
      productId: productId,
      quantity: quantity,
    );

    response.fold(
      (l) {
        emit(FailureState(l));
      },
      (r) {
        emit(SuccessState(r));
      },
    );
  }

  void removeProductFromCart(String productId) async {
    emit(LoadingState());

    var response =
        await _removeProductFromCartUseCase.execute(productId: productId);

    response.fold(
      (l) {
        emit(FailureState(l));
      },
      (r) {
        emit(SuccessState(r));
      },
    );
  }

  void clearCart() async {
    emit(LoadingState());

    var response = await _clearCartUseCase.execute();

    response.fold(
      (l) {
        emit(FailureState(l));
      },
      (r) {
        getCartProducts();
      },
    );
  }
}
