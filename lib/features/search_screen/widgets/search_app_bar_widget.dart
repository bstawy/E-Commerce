import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/extensions/extensions.dart';

class SearchAppBarWidget extends StatelessWidget {
  const SearchAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: get search controller from cubit
    final searchTextController = TextEditingController();

    return Container(
      height: 40.h,
      margin: EdgeInsets.only(top: 46.5.h, left: 24.w, right: 24.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.onBackground,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/search_icon.svg",
            colorFilter: ColorFilter.mode(
                context.theme.colorScheme.secondary, BlendMode.srcIn),
            width: 18.w,
            height: 18.h,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              controller: searchTextController,
              cursorColor: context.theme.colorScheme.secondary,
              style: context.theme.textTheme.labelMedium!.copyWith(
                color: context.theme.colorScheme.secondary,
              ),
              decoration: InputDecoration(
                hintText: "Find an organ...",
                hintStyle: context.theme.textTheme.labelMedium!.copyWith(
                  color: context.theme.colorScheme.secondary,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 8.h),
              ),
              scrollPadding: EdgeInsets.zero,
              onChanged: (searchedText) {
                //_search(searchedText);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.clear),
            iconSize: 18.r,
            color: context.theme.colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
