import 'package:flutter/material.dart';

import '../../features/home_layout/pages/layout.dart';
import '../../features/login/pages/login_screen.dart';
import '../../features/sign_up/pages/sign_up_screen.dart';
import 'page_route_names.dart';

class AppRouter {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(
            builder: (context) => const LoginScreen(), settings: settings);

      case PageRouteNames.signUp:
        return MaterialPageRoute(
            builder: (context) => const SignUpScreen(), settings: settings);

      case PageRouteNames.homeLayout:
        return MaterialPageRoute(
            builder: (context) => Layout(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (context) => const LoginScreen(), settings: settings);
    }
  }
}
