import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/di.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/widgets/custom_header_and_search.dart';
import '../../../domain/entities/home/brand_entity.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../manager/home_cubit.dart';
import '../widgets/home_grid_widget.dart';
import '../widgets/home_offers_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeCubit homeCubit = getIt<HomeCubit>();

  @override
  void initState() {
    super.initState();
    homeCubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      bloc: homeCubit,
      buildWhen: (previous, current) {
        if (current is LoadingState) return false;
        if (current is ErrorState) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is LoadingState) return true;
        if (current is ErrorState) return true;
        return false;
      },
      builder: (context, state) {
        if (state is SuccessState) {
          return buildSuccessWidget(state.categories ?? [], state.brands ?? []);
        }
        return Scaffold(
          body: Column(
            children: [
              const CustomHeaderAndSearch(),
              SizedBox(height: 350.h),
              const CircularProgressIndicator(),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is LoadingState) {
          // show loading
        }
        if (state is ErrorState) {
          // show error
        }
      },
    );
  }

  Widget buildSuccessWidget(List<Category> categories, List<Brand> brands) {
    return Scaffold(
      body: Column(
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
                    height: 370.h,
                    child: HomeGridWidget(
                      title: 'Categories',
                      gridList: categories,
                    ),
                  ).setVerticalPadding(context, 24.h),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: double.infinity,
                    height: 370.h,
                    child: HomeGridWidget(
                      title: 'Brands',
                      gridList: brands,
                    ),
                  ).setVerticalPadding(context, 24.h),
                ),
                // SliverToBoxAdapter(
                //   child: SizedBox(
                //     width: double.infinity,
                //     height: 250.h,
                //     child: HomeGridWidget(
                //       title: 'Brands',
                //       gridList: brands,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// SizedBox(
// height: MediaQuery.sizeOf(context).height - 100,
// child: Column(
// children: [
// GridView.builder(
// gridDelegate:
// const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// ),
// scrollDirection: Axis.horizontal,
// shrinkWrap: true,
// itemBuilder: (context, index) {
// return HomeCategoryWidget(
// category: categories[index],
// );
// },
// itemCount: categories.length,
// ),
// GridView.builder(
// gridDelegate:
// const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// ),
// scrollDirection: Axis.horizontal,
// shrinkWrap: true,
// itemBuilder: (context, index) {
// return HomeBrandWidget(
// brand: brands[index],
// );
// },
// itemCount: brands.length,
// ),
// ],
// ),
// ),
