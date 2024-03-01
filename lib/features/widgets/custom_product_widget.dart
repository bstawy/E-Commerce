import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/extensions/extensions.dart';
import '../../core/services/snackbar_service.dart';
import '../../domain/entities/home/product_entity.dart';
import '../home_layout/pages/views/wish_list_view/manager/wish_list_cubit.dart';

class CustomProductWidget extends StatelessWidget {
  final Product product;

  const CustomProductWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    WishListCubit wishListCubit = context.read<WishListCubit>();

    return Container(
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
          buildHeader(context, wishListCubit),
          SizedBox(height: 8.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.theme.textTheme.bodyLarge!.copyWith(
                  color: context.theme.colorScheme.onSecondary,
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
                children: [
                  Text(
                    "EGP ${product.priceAfterDiscount ?? product.price}",
                    style: context.theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Visibility(
                    visible: product.priceAfterDiscount != null,
                    child: Text(
                      "${product.price} EGP",
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
    );
  }

  Row buildFooter(BuildContext context) {
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
        Icon(
          Icons.add_circle,
          size: 35.r,
          color: context.theme.colorScheme.primary,
        ),
      ],
    );
  }

  ClipRRect buildHeader(BuildContext context, WishListCubit wishListCubit) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
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
              bloc: wishListCubit,
              listener: (context, state) {},
              builder: (context, state) {
                if (state is SuccessState) {
                  if (wishListCubit.wishListProductIds.contains(product.id)) {
                    product.isFavorite = true;
                    return buildFavoriteButton(
                      context,
                      () {
                        wishListCubit.removeProductFromWishList(product.id!);
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
