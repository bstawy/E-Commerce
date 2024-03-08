import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/extensions.dart';
import '../manager/cubit/categories_cubit.dart';
import 'category_list_item.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesCubit categoriesCubit = context.read<CategoriesCubit>();

    return Container(
      width: 150.w,
      height: MediaQuery.sizeOf(context).height - 230.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          bottomLeft: Radius.circular(10.r),
        ),
        border: Border(
          bottom: BorderSide(
              color: context.theme.colorScheme.primary.withOpacity(0.3)),
          left: BorderSide(
              color: context.theme.colorScheme.primary.withOpacity(0.3)),
          top: BorderSide(
            color: context.theme.colorScheme.primary.withOpacity(0.3),
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          bottomLeft: Radius.circular(10.r),
        ),
        child: ListView.builder(
          itemCount: categoriesCubit.categories!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (categoriesCubit.selectedCategoryIndex != index) {
                  categoriesCubit.changeCategory(index);
                }
              },
              child: CategoryListItem(
                category: categoriesCubit.categories![index],
                isSelected: categoriesCubit.selectedCategoryIndex == index,
              ),
            );
          },
        ),
      ),
    );
  }
}
