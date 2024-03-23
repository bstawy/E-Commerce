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
import '../widgets/custom_material_button.dart';
import 'widgets/product_images_carousel.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int currentIndex = 0;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)?.settings.arguments as Product;
    final WishListCubit wishListCubit = getIt<WishListCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: context.theme.colorScheme.primary,
        ),
        title: const Text("Product Details"),
        actions: [
          GestureDetector(
            onTap: () {
              context.pushNamed(PageRouteNames.cartScreen);
            },
            child: SvgPicture.asset("assets/icons/cart_icon.svg"),
          ).setOnlyPadding(context, 0, 0, 0, 16.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImagesCarousel(
                product: product, wishListCubit: wishListCubit),
            SizedBox(height: 24.h),
            buildTitleAndPrice(context, product),
            SizedBox(height: 16.h),
            buildRatingAndNumberOfItemsToBeBought(context, product),
            SizedBox(height: 16.h),
            buildDescription(context, product),
            SizedBox(height: 16.h),
            buildSizeSelector(context),
            SizedBox(height: 16.h),
            buildColorSelector(context),
            SizedBox(height: 48.h),
            buildTotalPriceAndAddToCartButton(context, product),
            SizedBox(height: 16.h),
          ],
        ).setHorizontalPadding(context, 16.w),
      ),
    );
  }

  Widget buildTitleAndPrice(BuildContext context, Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 250.w,
          child: Text(
            product.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.theme.textTheme.titleSmall!.copyWith(
              color: context.theme.colorScheme.onPrimary,
            ),
          ),
        ),
        Text(
          "EGP ${formatNumber(product.priceAfterDiscount ?? product.price!)}",
          style: context.theme.textTheme.titleSmall!.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }

  Widget buildRatingAndNumberOfItemsToBeBought(
      BuildContext context, Product product) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: context.theme.colorScheme.primary.withOpacity(0.3),
              )),
          child: Text(
            "${formatNumber(product.sold!)} Sold",
            style: context.theme.textTheme.bodyLarge,
          ),
        ),
        SizedBox(width: 8.w),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/rating_icon.svg"),
            Text(
              "${product.ratingsAverage} (${product.ratingsQuantity})",
              style: context.theme.textTheme.bodyLarge,
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 125.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (quantity > 1) quantity--;

                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: context.theme.colorScheme.background,
                    ),
                  ),
                  child: Icon(
                    Icons.remove,
                    color: context.theme.colorScheme.background,
                    size: 20.r,
                  ),
                ),
              ),
              Text(
                "$quantity",
                style: context.theme.textTheme.titleSmall,
              ),
              GestureDetector(
                onTap: () {
                  quantity++;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: context.theme.colorScheme.background,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: context.theme.colorScheme.background,
                    size: 20.r,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDescription(BuildContext context, Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: context.theme.textTheme.titleSmall!.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
        Text(
          product.description ?? "",
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: context.theme.textTheme.bodyLarge!.copyWith(
            color: context.theme.colorScheme.onPrimary.withOpacity(0.6),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildSizeSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: context.theme.textTheme.titleSmall!.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < 5; i++)
              Container(
                width: 35.w,
                height: 35.h,
                margin: EdgeInsets.only(right: 4.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == 2
                      ? context.theme.colorScheme.primary
                      : Colors.transparent,
                ),
                child: Text(
                  "${38 + i}",
                  overflow: TextOverflow.ellipsis,
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    color: i == 2
                        ? context.theme.colorScheme.background
                        : context.theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget buildColorSelector(BuildContext context) {
    List<Color> colors = [
      const Color(0xff2F2929),
      const Color(0xffBC3018),
      const Color(0xff0973DD),
      const Color(0xff02B935),
      const Color(0xffFF645A),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: context.theme.textTheme.titleSmall!.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < 5; i++)
              Container(
                width: 35.w,
                height: 35.h,
                margin: EdgeInsets.only(right: 4.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors[i],
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: i == 1 ? Colors.white : colors[i],
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget buildTotalPriceAndAddToCartButton(
      BuildContext context, Product product) {
    final cart.CartCubit cartCubit = getIt<cart.CartCubit>();

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total price",
                style: context.theme.textTheme.titleSmall!.copyWith(
                  color: context.theme.colorScheme.onPrimary.withOpacity(0.6),
                ),
              ),
              Text(
                product.priceAfterDiscount == null
                    ? "EGP ${formatNumber(product.price! * quantity)}"
                    : "EGP ${formatNumber(product.priceAfterDiscount! * quantity)}",
                style: context.theme.textTheme.titleSmall!.copyWith(
                  color: context.theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: BlocListener<cart.CartCubit, cart.CartState>(
            bloc: cartCubit,
            listener: (context, state) {
              if (state is cart.LoadingState) {
                configureEasyLoading();
                EasyLoading.show();
              } else if (state is cart.AddToCartSuccessState) {
                if (quantity > 1) {
                  cartCubit.updateCartProductQuantity(
                      product.id!, quantity.toString());
                }
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
              title: "Add to cart",
              titleStyle: context.theme.textTheme.titleSmall!.copyWith(
                color: context.theme.colorScheme.background,
              ),
              backgroundColor: context.theme.colorScheme.primary,
              borderRadius: 20.r,
              height: 50.h,
              onClicked: () {
                cartCubit.addProductToCart(product.id!);
              },
            ),
          ),
        ),
      ],
    );
  }
}
