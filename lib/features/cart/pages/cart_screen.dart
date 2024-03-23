import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/services/number_formatter.dart';
import '../../../core/services/shimmer_skeleton_service.dart';
import '../../home_layout/widgets/login_required_widget.dart';
import '../../widgets/custom_material_button.dart';
import '../manager/cart_cubit.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = context.read<CartCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: context.theme.colorScheme.primary,
        ),
        title: const Text("Cart"),
        actions: [
          BlocBuilder<CartCubit, CartState>(
            bloc: cartCubit..getCartProducts(),
            builder: (context, state) {
              if (state is SuccessState && state.data.products!.isNotEmpty) {
                return GestureDetector(
                  onTap: () {
                    cartCubit.clearCart();
                  },
                  child: SvgPicture.asset("assets/icons/delete_icon.svg"),
                ).setOnlyPadding(context, 0, 10.h, 0, 26.w);
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        bloc: cartCubit,
        builder: (context, state) {
          switch (state) {
            case InitialState():
              return buildLoadingShimmerWidget(context);
            case UnLoggedUserState():
              return const LoginRequiredWidget(
                  message: "Please login to see your Cart");
            case LoadingState():
              return buildLoadingShimmerWidget(context);
            case SuccessState():
              if (state.data.products!.isEmpty) {
                return buildEmptyWidget(context);
              }
              return buildSuccessWidget(context, state);

            case FailureState():
              if (state.serverFailure.statusCode == "404") {
                return buildEmptyWidget(context);
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(state.serverFailure.message!),
                ],
              );
            default:
              return buildEmptyWidget(context);
          }
        },
      ),
    );
  }

  Widget buildEmptyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your Cart is empty...",
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
        SizedBox(
          height: MediaQuery.sizeOf(context).height - 200.h,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.data.products!.length,
            itemBuilder: (context, index) {
              return CartItemWidget(
                product: state.data.products![index].product!,
                price: state.data.products![index].price!,
                quantity: state.data.products![index].count!,
              );
            },
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total price",
                    style: context.theme.textTheme.titleSmall!.copyWith(
                      color:
                          context.theme.colorScheme.onPrimary.withOpacity(0.6),
                    ),
                  ),
                  Text(
                    "EGP ${formatNumber(state.data.totalCartPrice!)}",
                    style: context.theme.textTheme.titleSmall!.copyWith(
                      color: context.theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: CustomMaterialButton(
                title: "Check Out\t\t->",
                backgroundColor: context.theme.colorScheme.primary,
                borderRadius: 20.r,
                padding: 8.r,
                titleStyle: context.theme.textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                height: 50.h,
                minWidth: 280.w,
                onClicked: () {
                  // TODO: handle transaction
                },
              ),
            ),
          ],
        ),
      ],
    ).setHorizontalPadding(context, 16.w);
  }

  Widget buildLoadingShimmerWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.grey[100]!,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.77,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Skeleton(
                width: double.infinity,
                height: 113.h,
              ).setVerticalPadding(context, 16.h);
            },
          ),
        ).setHorizontalPadding(context, 16.w),
      ),
    );
  }
}
