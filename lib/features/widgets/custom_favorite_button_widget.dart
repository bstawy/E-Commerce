import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/extensions/extensions.dart';
import '../../domain/entities/home/product_entity.dart';

class CustomFavoriteButtonWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const CustomFavoriteButtonWidget({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
