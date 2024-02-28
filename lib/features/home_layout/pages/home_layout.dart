import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/home_layout_cubit.dart';
import '../widgets/bottom_nav_bar_icon_widget.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      buildWhen: (previous, current) {
        if (current is HomeTabState) return true;
        if (current is CategoriesTabState) return true;
        if (current is WishListTabState) return true;
        if (current is ProfileTabState) return true;

        return false;
      },
      builder: (context, state) {
        return Scaffold(
          body: state.viewTab,
          bottomNavigationBar: buildBottomNavBar(context, state),
        );
      },
      listener: (BuildContext context, HomeLayoutState state) {},
    );
  }

  SizedBox buildBottomNavBar(BuildContext context, HomeLayoutState state) {
    return SizedBox(
      height: 55.h,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
        child: BottomNavigationBar(
          onTap: (index) =>
              BlocProvider.of<HomeLayoutCubit>(context).onTap(index),
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
                isSelected: state is WishListTabState,
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
