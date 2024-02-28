import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/di.dart';
import '../../../../widgets/login_required_widget.dart';
import '../manager/wish_list_cubit.dart';

class WishListView extends StatelessWidget {
  WishListView({super.key});

  final WishListCubit wishListCubit = getIt<WishListCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      bloc: wishListCubit,
      builder: (context, state) {
        if (state is UnAuthenticatedUserState) {
          return const LoginRequiredWidget(
              message: "Please login to see your WishList");
        }
        return Container();
      },
    );
  }
}
