import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/login_required_widget.dart';
import '../manager/wish_list_cubit.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    WishListCubit wishListCubit = context.read<WishListCubit>();

    return BlocBuilder<WishListCubit, WishListState>(
      bloc: wishListCubit..checkLogging(),
      builder: (context, state) {
        if (state is UnLoggedUserState) {
          return const LoginRequiredWidget(
              message: "Please login to see your WishList");
        } else {
          switch (state) {
            case LoadingState():
              return const Center(child: CircularProgressIndicator());
            case SuccessState():
              return ListView.builder(
                itemCount: state.wishList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.wishList[index].title ?? ""),
                    subtitle: Text(state.wishList[index].description ?? ""),
                  );
                },
              );
            case FailureState():
              debugPrint("Exception: ${state.serverFailure}");
              return Center(child: Text(state.serverFailure.message!));
            default:
              return const LoginRequiredWidget(
                  message: "Please login to see your WishList");
          }
        }
      },
    );
  }
}
