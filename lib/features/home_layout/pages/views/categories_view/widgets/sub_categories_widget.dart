import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/config/page_route_names.dart';
import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../domain/entities/home/category_entity.dart';
import '../manager/cubit/categories_cubit.dart';

class SubCategoriesWidget extends StatelessWidget {
  const SubCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 220.w,
          height: 95.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                context
                    .read<CategoriesCubit>()
                    .categories![
                        context.read<CategoriesCubit>().selectedCategoryIndex]
                    .imageUrl!,
              ),
              opacity: 0.8,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            context
                .read<CategoriesCubit>()
                .categories![
                    context.read<CategoriesCubit>().selectedCategoryIndex]
                .name!,
            style: TextStyle(
              color: context.theme.colorScheme.onPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width - 206.w,
          height: MediaQuery.sizeOf(context).height - 310.h,
          child: GridView.builder(
            padding: EdgeInsets.only(top: 16.h),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 13.h,
              crossAxisSpacing: 13.w,
              childAspectRatio:
                  ((MediaQuery.of(context).size.width - (24.w + 16.w)) / 2) /
                      260.h,
            ),
            itemCount: context.read<CategoriesCubit>().subCategories!.length,
            itemBuilder: (context, index) => buildGridItem(
              context,
              context.read<CategoriesCubit>().subCategories![index],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildGridItem(BuildContext context, Category category) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(PageRouteNames.categoryProductsScreen,
            arguments: context.read<CategoriesCubit>().categories![
                context.read<CategoriesCubit>().selectedCategoryIndex]);
      },
      child: Column(
        children: [
          CachedNetworkImage(
            imageBuilder: (context, imageProvider) {
              return Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            imageUrl: context
                .read<CategoriesCubit>()
                .categories![
                    context.read<CategoriesCubit>().selectedCategoryIndex]
                .imageUrl!,
            height: 70,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            category.name ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
