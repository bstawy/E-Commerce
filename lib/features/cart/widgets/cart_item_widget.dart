import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../domain/entities/home/product_entity.dart';

class CartItemWidget extends StatefulWidget {
  final Product product;
  final num price;
  final num quantity;

  const CartItemWidget({
    super.key,
    required this.product,
    required this.price,
    required this.quantity,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  late int numberOfItemstoBeAddedToCart;

  @override
  void initState() {
    super.initState();
    numberOfItemstoBeAddedToCart = widget.quantity.toInt();
  }

  @override
  Widget build(BuildContext context) {
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
            imageUrl: widget.product.imageCover ?? "",
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageBuilder: (context, imageProvider) {
              return Container(
                width: 120.w,
                height: 113.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: context.theme.colorScheme.primary.withOpacity(0.3),
                    width: 1,
                  ),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
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
                  widget.product.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.theme.textTheme.titleSmall!.copyWith(
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
                Text(
                  "Brand: ${widget.product.brand?.name}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "EGP ${widget.price}",
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
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
                  //TODO: delete product from cart
                  // context
                  //     .read<WishListCubit>()
                  //     .removeProductFromWishList(product.id!);
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
                  child: SvgPicture.asset("assets/icons/delete_icon.svg"),
                ),
              ),
              Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //TODO: update number of items in cart
                        numberOfItemstoBeAddedToCart > 0
                            ? numberOfItemstoBeAddedToCart--
                            : numberOfItemstoBeAddedToCart = 0;
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
                      "$numberOfItemstoBeAddedToCart",
                      style: context.theme.textTheme.titleSmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO: update number of items in cart
                        numberOfItemstoBeAddedToCart++;
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
          ).setOnlyPadding(context, 0, 8.h, 0, 8.w),
        ],
      ),
    );
  }
}
