import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../core/services/snackbar_service.dart';
import '../../../../../widgets/custom_header_and_search.dart';
import '../manager/cubit/categories_cubit.dart';
import '../widgets/categories_shimmer_loading_widget.dart';
import '../widgets/categories_widget.dart';
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
              buildCategoriesWidget(categoriesCubit),
              SizedBox(width: 24.w),
              buildSubCategoriesWidget(categoriesCubit),
            ],
          ),
        ).setHorizontalPadding(context, 16.w),
      ],
    );
  }

  Widget buildCategoriesWidget(CategoriesCubit categoriesCubit) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      bloc: categoriesCubit..getCategories(),
      buildWhen: (previous, current) {
        if (current is FailureState) return false;
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
        } else {
          return const CategoriesWidget();
        }
      },
      listener: (context, state) {
        if (state is FailureState) {
          SnackBarService.showErrorMessage(
              context, state.serverFailure!.message!);
        }
      },
    );
  }

  Widget buildSubCategoriesWidget(CategoriesCubit categoriesCubit) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
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
    );
  }
}
