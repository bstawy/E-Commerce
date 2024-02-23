import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/page_route_names.dart';
import '../../../core/extensions/extensions.dart';
import '../../../main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                navigatorKey.currentState!.pushNamed(PageRouteNames.signUp);
              },
              child: SvgPicture.asset("assets/images/route_logo.svg"),
            ),
            const Text("Login Screen"),
          ],
        ),
      ),
    );
  }
}
