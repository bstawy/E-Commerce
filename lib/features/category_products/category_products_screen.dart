import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/config/page_route_names.dart';
import '../../core/di/di.dart';
import '../../core/extensions/extensions.dart';
import '../../core/services/shimmer_skeleton_service.dart';
import '../../core/services/snackbar_service.dart';
import '../../domain/entities/home/sub_category_entity.dart';
import '../home_layout/pages/views/wish_list_view/manager/wish_list_cubit.dart'
    as wish_list_cubit;
import '../widgets/custom_product_widget.dart';
import 'manager/category_products_cubit.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SubCategory category =
        ModalRoute.of(context)?.settings.arguments as SubCategory;
    CategoryProductsCubit cubit = getIt<CategoryProductsCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: context.theme.colorScheme.primary,
        ),
        title: Text(category.name!),
        actions: [
          GestureDetector(
            onTap: () {
              context.pushNamed(PageRouteNames.cartScreen);
            },
            child: SvgPicture.asset("assets/icons/cart_icon.svg"),
          ).setOnlyPadding(context, 0, 0, 0, 16.w),
        ],
      ),
      body: BlocConsumer<CategoryProductsCubit, CategoryProductsState>(
        bloc: cubit..getProducts(category.categoryId!),
        listener: (context, state) {
          if (state is FailureState) {
            SnackBarService.showErrorMessage(
                context, state.serverFailure.message!);
          }
        },
        builder: (context, state) {
          if (state is SuccesState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: BlocProvider(
                    create: (context) => getIt<wish_list_cubit.WishListCubit>(),
                    child: GridView.builder(
                      padding: EdgeInsets.only(
                          top: 16.h, left: 16.w, right: 0, bottom: 0),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 0,
                        childAspectRatio:
                            ((MediaQuery.of(context).size.width - (16 * 3)) /
                                    2) /
                                290,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) =>
                          CustomProductWidget(product: state.products[index]),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is EmptyState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/no_data_image.png"),
                  SizedBox(height: 24.h),
                  Text(
                    "No Data ...",
                    style: context.theme.textTheme.titleSmall!.copyWith(
                      color: context.theme.colorScheme.onPrimary,
                    ),
                  ).setHorizontalPadding(context, 32.w),
                ],
              ),
            );
          }
          return buildCategoryProductsShimmerLoadingWidget(context);
        },
      ),
    );
  }

  Widget buildCategoryProductsShimmerLoadingWidget(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 16.h),
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) => Row(
          children: [
            Column(
              children: [
                Skeleton(
                  height: 320.h,
                  width: MediaQuery.sizeOf(context).width / 2 - 22,
                ),
                SizedBox(height: 8.h),
              ],
            ),
            SizedBox(width: 16.w),
            Column(
              children: [
                Skeleton(
                  height: 320.h,
                  width: MediaQuery.sizeOf(context).width / 2 - 22,
                ),
              ],
            ),
          ],
        ),
      ).setHorizontalPadding(context, 16.w),
    );
  }
}
