import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/extensions.dart';
import '../../../../../widgets/custom_header_and_search.dart';
import '../../../../widgets/login_required_widget.dart';
import '../manager/wish_list_cubit.dart';
import '../widgets/wish_list_item_widget.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    WishListCubit wishListCubit = context.read<WishListCubit>();

    return BlocBuilder<WishListCubit, WishListState>(
      bloc: wishListCubit..checkLogging(),
      builder: (context, state) {
        switch (state) {
          case InitialState():
            return const SafeArea(
                child: Center(child: CircularProgressIndicator()));
          case UnLoggedUserState():
            return const LoginRequiredWidget(
                message: "Please login to see your WishList");
          case LoadingState():
            return const SafeArea(
                child: Center(child: CircularProgressIndicator()));
          case SuccessState():
            return buildSuccessWidget(context, state);
          case EmptyState():
            return buildEmptyWidget(context);
          case FailureState():
            debugPrint("Exception: ${state.serverFailure}");
            return Center(child: Text(state.serverFailure.message!));
          default:
            return buildEmptyWidget(context);
        }
      },
    );
  }

  Widget buildEmptyWidget(BuildContext context) {
    return Column(
      children: [
        const CustomHeaderAndSearch(),
        SizedBox(height: 280.h),
        Text(
          "Your WishList is empty...",
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleSmall!.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ).setHorizontalPadding(context, 32.w),
      ],
    );
  }

  Widget buildSuccessWidget(BuildContext context, SuccessState state) {
    return Column(
      children: [
        const CustomHeaderAndSearch(),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.wishList.length,
            itemBuilder: (context, index) {
              return WishListItemWidget(product: state.wishList[index]);
            },
          ).setHorizontalPadding(context, 16.w),
        ),
      ],
    );
  }
}
