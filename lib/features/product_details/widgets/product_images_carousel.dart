import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/services/snackbar_service.dart';
import '../../../domain/entities/home/product_entity.dart';
import '../../home_layout/pages/views/wish_list_view/manager/wish_list_cubit.dart';
import '../../widgets/custom_favorite_button_widget.dart';

class ProductImagesCarousel extends StatefulWidget {
  final Product product;
  final WishListCubit wishListCubit;

  const ProductImagesCarousel({
    super.key,
    required this.product,
    required this.wishListCubit,
  });

  @override
  State<ProductImagesCarousel> createState() => _ProductImagesCarouselState();
}

class _ProductImagesCarouselState extends State<ProductImagesCarousel> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.product.id!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          fit: StackFit.loose,
          children: [
            buildImagesCarousel(widget.product),
            buildFavoriteButtonWidget(widget.wishListCubit, widget.product),
            buildDotsIndicator(widget.product, context),
          ],
        ),
      ),
    );
  }

  Positioned buildFavoriteButtonWidget(
      WishListCubit wishListCubit, Product product) {
    return Positioned(
      right: 0,
      child: BlocConsumer<WishListCubit, WishListState>(
        bloc: wishListCubit..checkLogging(),
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SuccessState) {
            if (wishListCubit.wishListProductIds.contains(product.id)) {
              product.isFavorite = true;
              return CustomFavoriteButtonWidget(
                product: product,
                onTap: () {
                  wishListCubit.removeProductFromWishList(product.id!);
                },
              );
            } else {
              product.isFavorite = false;
              return CustomFavoriteButtonWidget(
                product: product,
                onTap: () {
                  wishListCubit.addProductToWishList(product.id!);
                },
              );
            }
          }
          return CustomFavoriteButtonWidget(
            product: product,
            onTap: () {
              SnackBarService.showErrorMessage(
                  context, "You are not logged in");
            },
          );
        },
      ),
    );
  }

  Widget buildImagesCarousel(Product product) {
    return SizedBox(
      height: 300.h,
      child: PageView.builder(
        pageSnapping: true,
        onPageChanged: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        itemCount: product.images!.length,
        itemBuilder: (context, index) {
          return buildProductImage(product.images![index]);
        },
      ),
    );
  }

  Widget buildProductImage(String productImageUrl) {
    return CachedNetworkImage(
      imageUrl: productImageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: double.maxFinite,
          height: 300.h,
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
        width: double.maxFinite,
        height: 300.h,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildDotsIndicator(Product product, BuildContext context) {
    return Positioned(
      bottom: 0,
      child: IntrinsicWidth(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 175.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < product.images!.length; i++)
                Container(
                  width: 10.w,
                  height: 10.h,
                  margin: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.theme.colorScheme.primary,
                    ),
                    color: currentPageIndex == i
                        ? context.theme.colorScheme.primary
                        : Colors.transparent,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
