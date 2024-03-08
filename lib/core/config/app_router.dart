import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/manager/auth_cubit.dart';
import '../../features/auth/pages/login/login_screen.dart';
import '../../features/auth/pages/register/register_screen.dart';
import '../../features/home_layout/manager/home_layout_cubit.dart';
import '../../features/home_layout/pages/home_layout.dart';
import '../../features/product_details/product_details_screen.dart';
import '../di/di.dart';
import 'page_route_names.dart';

class AppRouter {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            lazy: false,
            create: (_) => getIt<HomeLayoutCubit>(),
            child: HomeLayout(),
          ),
          settings: settings,
        );

      case PageRouteNames.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
          settings: settings,
        );

      case PageRouteNames.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const RegisterScreen(),
          ),
          settings: settings,
        );

      case PageRouteNames.productDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const ProductDetailsScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => HomeLayout(),
          settings: settings,
        );
    }
  }
}
