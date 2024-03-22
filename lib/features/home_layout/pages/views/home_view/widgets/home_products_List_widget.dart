import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../domain/entities/home/product_entity.dart';
import '../../../../../widgets/custom_product_widget.dart';
import '../../wish_list_view/manager/wish_list_cubit.dart';

class HomeProductsListWidget extends StatelessWidget {
  final List<Product>? products;

  const HomeProductsListWidget({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WishListCubit>()..checkLogging(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Most Selling",
                style: context.theme.textTheme.titleSmall!.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
              Text(
                "View all",
                style: context.theme.textTheme.bodySmall,
              ),
            ],
          ).setHorizontalPadding(context, 16.w),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(
                  top: 16.h, left: 16.w, right: 16.w, bottom: 24),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: products?.length,
              itemBuilder: (context, index) =>
                  CustomProductWidget(product: products![index]),
            ),
          ),
        ],
      ),
    );
  }
}
