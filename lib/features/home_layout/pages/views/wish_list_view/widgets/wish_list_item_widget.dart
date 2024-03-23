import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/services/loading_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/config/page_route_names.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../core/services/number_formatter.dart';
import '../../../../../../core/services/snackbar_service.dart';
import '../../../../../../domain/entities/home/product_entity.dart';
import '../../../../../cart/manager/cart_cubit.dart' as cart;
import '../../../../../widgets/custom_material_button.dart';
import '../manager/wish_list_cubit.dart';

class WishListItemWidget extends StatelessWidget {
  final Product product;

  const WishListItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart.CartCubit cartCubit = getIt<cart.CartCubit>();

    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 113.h,
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: context.theme.colorScheme.primary.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: product.imageCover ?? "",
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageBuilder: (context, imageProvider) {
              return GestureDetector(
                onTap: () {
                  context.pushNamed(PageRouteNames.productDetailsScreen,
                      arguments: product);
                },
                child: Container(
                  width: 120.w,
                  height: 113.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: context.theme.colorScheme.primary.withOpacity(0.3),
                      width: 1,
                    ),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 8.w),
          SizedBox(
            width: 145.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.theme.textTheme.titleSmall!.copyWith(
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
                Text(
                  "Brand: ${product.brand?.name}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "EGP ${formatNumber(product.priceAfterDiscount ?? product.price!)}",
                      style: context.theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Visibility(
                      visible: product.priceAfterDiscount != null,
                      child: Text(
                        "EGP ${formatNumber(product.price!)}",
                        style: context.theme.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).setVerticalPadding(context, 8.h),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  context
                      .read<WishListCubit>()
                      .removeProductFromWishList(product.id!);
                },
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  margin: EdgeInsets.only(top: 8.h),
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.colorScheme.background,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 5),
                          blurRadius: 10,
                          spreadRadius: 0,
                          color: Colors.black.withOpacity(0.15)),
                    ],
                  ),
                  child:
                      SvgPicture.asset("assets/icons/favorite_filled_icon.svg"),
                ),
              ),
              BlocListener<cart.CartCubit, cart.CartState>(
                bloc: cartCubit,
                listener: (context, state) {
                  if (state is cart.LoadingState) {
                    configureEasyLoading();
                    EasyLoading.show();
                  } else if (state is cart.AddToCartSuccessState) {
                    EasyLoading.dismiss();
                    SnackBarService.showSuccessMessage(context, state.message);
                  } else if (state is cart.FailureState) {
                    EasyLoading.dismiss();
                    SnackBarService.showErrorMessage(
                        context, state.serverFailure.message!);
                  } else if (state is cart.SuccessState) {
                    EasyLoading.dismiss();
                  } else if (state is cart.UnLoggedUserState) {
                    EasyLoading.dismiss();
                    SnackBarService.showErrorMessage(
                        context, "Please login to add product to cart");
                  }
                },
                child: CustomMaterialButton(
                  title: "Add to Cart",
                  titleStyle: context.theme.textTheme.bodySmall!.copyWith(
                    color: context.theme.colorScheme.background,
                  ),
                  backgroundColor: context.theme.colorScheme.primary,
                  height: 36.h,
                  minWidth: 75.w,
                  padding: 9.r,
                  onClicked: () {
                    cartCubit.addProductToCart(product.id!);
                  },
                ),
              ),
            ],
          ).setOnlyPadding(context, 0, 0, 0, 8.w),
        ],
      ),
    );
  }
}
