import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/config/page_route_names.dart';
import '../../core/di/di.dart';
import '../../core/extensions/extensions.dart';
import '../../core/services/loading_service.dart';
import '../../core/services/number_formatter.dart';
import '../../core/services/snackbar_service.dart';
import '../../domain/entities/home/product_entity.dart';
import '../cart/manager/cart_cubit.dart' as cart;
import '../home_layout/pages/views/wish_list_view/manager/wish_list_cubit.dart';

class CustomProductWidget extends StatelessWidget {
  final Product product;

  const CustomProductWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<WishListCubit>()),
        BlocProvider(create: (context) => getIt<cart.CartCubit>()),
      ],
      child: Container(
        width: 190.w,
        margin: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: context.theme.colorScheme.primary.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(context, context.read<WishListCubit>()),
            SizedBox(height: 8.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    color: context.theme.colorScheme.primary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  product.description ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "EGP ${formatNumber(product.priceAfterDiscount ?? product.price!)}",
                      style: context.theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    //SizedBox(width: 16.w),
                    Visibility(
                      visible: product.priceAfterDiscount != null,
                      child: Text(
                        "${formatNumber(product.price!)} EGP",
                        style: context.theme.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                buildFooter(context),
              ],
            ).setHorizontalPadding(context, 8.w),
          ],
        ),
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    cart.CartCubit cartCubit = getIt<cart.CartCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Review (${product.ratingsAverage})",
              style: context.theme.textTheme.bodySmall!.copyWith(
                color: const Color(0xff06004F),
              ),
            ),
            SvgPicture.asset("assets/icons/rating_icon.svg")
                .setHorizontalPadding(context, 4.w),
          ],
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
          child: GestureDetector(
            onTap: () {
              cartCubit.addProductToCart(product.id!);
            },
            child: Icon(
              Icons.add_circle,
              size: 35.r,
              color: context.theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHeader(BuildContext context, WishListCubit wishListCubit) {
    return Hero(
      tag: product.id!,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        child: GestureDetector(
          onTap: () => context.pushNamed(
            PageRouteNames.productDetailsScreen,
            arguments: product,
          ),
          child: Stack(
            fit: StackFit.loose,
            children: [
              CachedNetworkImage(
                imageUrl: product.imageCover ?? "",
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 190.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) => Image.asset(
                  "assets/images/launcher_icon.png",
                  width: 190.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                child: BlocConsumer<WishListCubit, WishListState>(
                  bloc: wishListCubit..checkLogging(),
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is SuccessState) {
                      if (wishListCubit.wishListProductIds
                          .contains(product.id)) {
                        product.isFavorite = true;
                        return buildFavoriteButton(
                          context,
                          () {
                            wishListCubit
                                .removeProductFromWishList(product.id!);
                          },
                        );
                      } else {
                        product.isFavorite = false;
                        return buildFavoriteButton(
                          context,
                          () {
                            wishListCubit.addProductToWishList(product.id!);
                          },
                        );
                      }
                    }
                    return buildFavoriteButton(
                      context,
                      () {
                        SnackBarService.showErrorMessage(
                            context, "You are not logged in");
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFavoriteButton(BuildContext context, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 30.w,
        height: 30.h,
        margin: EdgeInsets.all(8.r),
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
        child: (product.isFavorite!)
            ? SvgPicture.asset("assets/icons/favorite_filled_icon.svg")
            : SvgPicture.asset("assets/icons/favorite_icon.svg"),
      ),
    );
  }
}
