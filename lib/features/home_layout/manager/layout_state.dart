part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {
  Widget get viewTab;
}

class HomeTabState extends LayoutState {
  @override
  Widget get viewTab => const HomeView();
}

class CategoriesTabState extends LayoutState {
  @override
  Widget get viewTab => const HomeView();
}

class FavoritesTabState extends LayoutState {
  @override
  Widget get viewTab => const HomeView();
}

class ProfileTabState extends LayoutState {
  @override
  Widget get viewTab => const HomeView();
}
