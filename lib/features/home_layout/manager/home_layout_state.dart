part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutState {
  Widget get viewTab;
}

class HomeTabState extends HomeLayoutState {
  @override
  Widget get viewTab => BlocProvider(
        create: (context) => getIt<HomeCubit>(),
        child: const HomeView(),
      );
}

class CategoriesTabState extends HomeLayoutState {
  @override
  Widget get viewTab => MultiBlocProvider(
        providers: [
          BlocProvider<CategoriesCubit>(
            create: (context) => getIt<CategoriesCubit>(),
          ),
          BlocProvider<SubCategoriesCubit>(
            create: (context) => getIt<SubCategoriesCubit>(),
          ),
        ],
        child: const CategoriesView(),
      );
}

class WishListTabState extends HomeLayoutState {
  @override
  Widget get viewTab => BlocProvider(
        create: (context) => getIt<WishListCubit>(),
        child: const WishListView(),
      );
}

class ProfileTabState extends HomeLayoutState {
  @override
  Widget get viewTab => const ProfileView();
}
