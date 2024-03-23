import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/extensions/extensions.dart';
import '../../core/config/page_route_names.dart';

class CustomHeaderAndSearch extends StatelessWidget {
  const CustomHeaderAndSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      right: true,
      bottom: true,
      minimum: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/images/route_logo.svg",
            colorFilter: ColorFilter.mode(
                context.theme.colorScheme.primary, BlendMode.srcIn),
            width: 75.w,
            height: 32.h,
            fit: BoxFit.contain,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 50.h,
                  margin: EdgeInsets.only(top: 16.h, bottom: 16.h, right: 24.w),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border:
                        Border.all(color: context.theme.colorScheme.primary),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Navigate to search screen
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: context.theme.colorScheme.primary,
                          size: 24.r,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "What do you search for ?",
                          style: context.theme.textTheme.bodySmall!.copyWith(
                            color: context.theme.colorScheme.primary
                                .withOpacity(0.6),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.pushNamed(PageRouteNames.cartScreen);
                },
                child: SvgPicture.asset(
                  "assets/icons/cart_icon.svg",
                  colorFilter: ColorFilter.mode(
                      context.theme.colorScheme.primary, BlendMode.srcIn),
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ],
      ).setOnlyPadding(context, 8.h, 0, 0, 0),
    );
  }
}
