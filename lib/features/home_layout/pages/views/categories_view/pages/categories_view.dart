import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../core/services/snackbar_service.dart';
import '../../../../../widgets/custom_header_and_search.dart';
import '../manager/categories_cubit/categories_cubit.dart';
import '../manager/sub_categories_cubit/sub_categories_cubit.dart';
import '../widgets/categories_shimmer_loading_widget.dart';
import '../widgets/category_list_item.dart';
import '../widgets/sub_categories_shimmer_loading_widget.dart';
import '../widgets/sub_categories_widget.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeaderAndSearch(),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<CategoriesCubit, CategoriesState>(
                bloc: context.read<CategoriesCubit>()..getCategories(),
                buildWhen: (previous, current) {
                  if (current is ChangeCategoryState) false;
                  return true;
                },
                builder: (context, state) {
                  debugPrint(
                      "Categories Cubit State: ${state is CategoriesSuccessState}");
                  if (state is CategoriesSuccessState) {
                    return buildCategoriesWidget(context, state);
                  } else if (state is CategoriesFailureState) {
                    SnackBarService.showErrorMessage(
                        context, state.serverFailure!.message!);
                  }
                  return const CategoriesShimmerLoadingWidget();
                },
              ),
              SizedBox(width: 24.w),
              BlocConsumer<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesSuccessState) {
                    return BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
                      bloc: context.read<SubCategoriesCubit>()
                        ..getSubCategoriesOnCategory(state
                            .categories[context
                                .read<CategoriesCubit>()
                                .selectedCategoryIndex]
                            .id!),
                      builder: (context, state) {
                        debugPrint("Sub Categories Cubit State: $state");
                        if (state is SubCategoriesSuccessState) {
                          return SubCategoriesWidget(
                            state: state,
                          );
                        } else if (state is SubCategoriesFailureState) {
                          SnackBarService.showErrorMessage(
                              context, state.serverFailure.message!);
                        }
                        return const SubCategoriesShimmerLoadingWidget();
                      },
                    );
                  }
                  return const SubCategoriesShimmerLoadingWidget();
                },
                listener: (context, state) {},
              ),
            ],
          ),
        ).setHorizontalPadding(context, 16.w),
      ],
    );
  }

  Container buildCategoriesWidget(
      BuildContext context, CategoriesSuccessState state) {
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
          itemCount: state.categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (context.read<CategoriesCubit>().selectedCategoryIndex !=
                    index) {
                  context.read<CategoriesCubit>().changeCategory(index);
                  final categoryId = state.categories[index].id!;
                  context
                      .read<SubCategoriesCubit>()
                      .getSubCategoriesOnCategory(categoryId);
                }
              },
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                bloc: context.read<CategoriesCubit>(),
                buildWhen: (previous, current) {
                  if (previous is CategoriesSuccessState &&
                      current is ChangeCategoryState) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  return CategoryListItem(
                    category:
                        context.read<CategoriesCubit>().categories![index],
                    isSelected:
                        context.read<CategoriesCubit>().selectedCategoryIndex ==
                            index,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

/*
getSubCategoriesOnCategory(context
                            .read<CategoriesCubit>()
                            .categories![context
                                .read<CategoriesCubit>()
                                .selectedCategoryIndex]
                            .id!),
*/