import '../widgets/category_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../core/services/snackbar_service.dart';
import '../../../../../widgets/custom_header_and_search.dart';
import '../manager/cubit/categories_cubit.dart';
import '../widgets/categories_shimmer_loading_widget.dart';
import '../widgets/sub_categories_shimmer_loading_widget.dart';
import '../widgets/sub_categories_widget.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesCubit categoriesCubit = context.read<CategoriesCubit>();

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
              BlocConsumer<CategoriesCubit, CategoriesState>(
                bloc: categoriesCubit..getCategories(),
                buildWhen: (previous, current) {
                  if (current is FailureState) return false;
                  if (current is SubCategoriesLoadingState) return true;
                  return true;
                },
                listenWhen: (previous, current) {
                  if (current is SubCategoriesLoadedState) return true;
                  if (current is FailureState) return true;
                  return false;
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const CategoriesShimmerLoadingWidget();
                  }
                  return buildCategoriesWidget(context);
                },
                listener: (context, state) {
                  if (state is FailureState) {
                    SnackBarService.showErrorMessage(
                        context, state.serverFailure!.message!);
                  }
                },
              ),
              SizedBox(width: 24.w),
              BlocConsumer<CategoriesCubit, CategoriesState>(
                bloc: categoriesCubit,
                buildWhen: (previous, current) {
                  if (current is FailureState) return false;
                  return true;
                },
                listenWhen: (previous, current) {
                  if (current is FailureState) return true;
                  return false;
                },
                builder: (context, state) {
                  if (state is SubCategoriesLoadedState) {
                    return const SubCategoriesWidget();
                  }
                  return const SubCategoriesShimmerLoadingWidget();
                },
                listener: (context, state) {
                  if (state is FailureState) {
                    SnackBarService.showErrorMessage(
                        context, state.serverFailure!.message!);
                  }
                },
              ),
            ],
          ),
        ).setHorizontalPadding(context, 16.w),
      ],
    );
  }

  Container buildCategoriesWidget(BuildContext context) {
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
          itemCount: context.read<CategoriesCubit>().categories!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (context.read<CategoriesCubit>().selectedCategoryIndex !=
                    index) {
                  context.read<CategoriesCubit>().changeCategory(index);
                }
              },
              child: CategoryListItem(
                category: context.read<CategoriesCubit>().categories![index],
                isSelected:
                    context.read<CategoriesCubit>().selectedCategoryIndex ==
                        index,
              ),
            );
          },
        ),
      ),
    );
  }
}
