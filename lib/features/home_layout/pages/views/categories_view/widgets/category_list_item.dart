import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../domain/entities/home/category_entity.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;
  final bool isSelected;
  const CategoryListItem({
    super.key,
    required this.category,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 85.h,
      color: isSelected ? Colors.white : context.theme.colorScheme.onSecondary,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Visibility(
            visible: isSelected,
            child: Container(
              height: double.maxFinite,
              width: 7.w,
              margin: EdgeInsets.only(right: 5.w),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.primary,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.r),
                  bottom: Radius.circular(20.r),
                ),
              ),
            ),
          ),
          SizedBox(
            width: isSelected ? 125.w : 138.w,
            child: Text(
              category.name!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: context.theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ).setHorizontalAndVerticalPadding(context, 5.w, 5.h),
    );
  }
}
