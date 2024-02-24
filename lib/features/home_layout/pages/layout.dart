import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/di.dart';
import '../manager/layout_cubit.dart';
import '../widgets/bottom_nav_bar_icon_widget.dart';

class Layout extends StatelessWidget {
  Layout({super.key});

  final LayoutCubit layoutCubit = getIt<LayoutCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      bloc: layoutCubit,
      builder: (context, state) {
        return Scaffold(
          body: state.viewTab,
          bottomNavigationBar: buildBottomNavBar(state),
        );
      },
    );
  }

  SizedBox buildBottomNavBar(LayoutState state) {
    return SizedBox(
      height: 55.h,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
        child: BottomNavigationBar(
          onTap: (index) => layoutCubit.onTap(index),
          items: [
            BottomNavigationBarItem(
              icon: BottomNavBarIconWidget(
                iconPath: "assets/icons/home_icon.svg",
                isSelected: state is HomeTabState,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: BottomNavBarIconWidget(
                iconPath: "assets/icons/categories_icon.svg",
                isSelected: state is CategoriesTabState,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: BottomNavBarIconWidget(
                iconPath: "assets/icons/favorite_icon.svg",
                isSelected: state is FavoritesTabState,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: BottomNavBarIconWidget(
                iconPath: "assets/icons/profile_icon.svg",
                isSelected: state is ProfileTabState,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
