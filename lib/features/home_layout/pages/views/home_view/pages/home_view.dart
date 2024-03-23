import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../core/services/shimmer_circular_skeleton_service.dart';
import '../../../../../../core/services/shimmer_skeleton_service.dart';
import '../../../../../../core/services/snackbar_service.dart';
import '../../../../../../domain/entities/home/brand_entity.dart';
import '../../../../../../domain/entities/home/category_entity.dart';
import '../../../../../../domain/entities/home/product_entity.dart';
import '../../../../../widgets/custom_header_and_search.dart';
import '../manager/home_cubit.dart';
import '../widgets/home_grid_widget.dart';
import '../widgets/home_offers_widget.dart';
import '../widgets/home_products_List_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();

    return BlocConsumer<HomeCubit, HomeStates>(
      bloc: homeCubit..fetchData(),
      buildWhen: (previous, current) {
        if (current is LoadingState) return false;
        if (current is FailureState) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is LoadingState) return true;
        if (current is FailureState) return true;
        return false;
      },
      builder: (context, state) {
        if (state is SuccessState) {
          return buildSuccessWidget(
            context,
            homeCubit.categories ?? [],
            homeCubit.brands ?? [],
            homeCubit.products ?? [],
          );
        }
        return buildLoadingShimmerWidget(context);
      },
      listener: (context, state) {
        if (state is FailureState) {
          SnackBarService.showErrorMessage(
              context, state.serverFailure.message!);
        }
      },
    );
  }

  Widget buildSuccessWidget(BuildContext context, List<Category> categories,
      List<Brand> brands, List<Product> products) {
    return Column(
      children: [
        const CustomHeaderAndSearch(),
        Expanded(
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 210.h,
                  child: const HomeOffersWidget(),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  height: 365.h,
                  child: HomeGridWidget(
                    title: 'Popular Categories',
                    gridList: categories,
                  ),
                ).setOnlyPadding(context, 24.h, 24.h, 0, 0),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  height: 365.h,
                  child: HomeGridWidget(
                    title: 'Popular Brands',
                    gridList: brands,
                    imageFit: BoxFit.contain,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 465.h,
                  child: HomeProductsListWidget(
                    products: products,
                  ).setOnlyPadding(context, 24.h, 24.h, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLoadingShimmerWidget(BuildContext context) {
    return Column(
      children: [
        const CustomHeaderAndSearch(),
        Shimmer.fromColors(
          baseColor: Colors.black,
          highlightColor: Colors.grey[100]!,
          child: Column(
            children: [
              Skeleton(
                width: double.infinity,
                height: 200.h,
              ),
              SizedBox(height: 24.h),
              Skeleton(
                width: double.infinity,
                height: 30.h,
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return CircularSkeleton(size: 100.r)
                        .setHorizontalPadding(context, 8.w);
                  },
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return CircularSkeleton(size: 100.r)
                        .setHorizontalPadding(context, 8.w);
                  },
                ),
              ),
              SizedBox(height: 24.h),
              Skeleton(
                width: double.infinity,
                height: 30.h,
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Skeleton(
                      width: 190.h,
                      height: 150.w,
                    ).setHorizontalPadding(context, 8.w);
                  },
                ),
              ),
            ],
          ).setHorizontalPadding(context, 16.w),
        )
      ],
    );
  }
}
