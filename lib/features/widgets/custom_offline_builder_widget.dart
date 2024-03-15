import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/extensions/extensions.dart';

class CustomOfflineBuilderWidget extends StatelessWidget {
  final Widget whenOnlineWidget;
  const CustomOfflineBuilderWidget({
    super.key,
    required this.whenOnlineWidget,
  });

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return whenOnlineWidget;
        } else {
          return buildNoInternetWidget(context);
        }
      },
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Center buildNoInternetWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/no_internet_image.png"),
          SizedBox(height: 24.h),
          Text(
            "No internet connection ...",
            textAlign: TextAlign.center,
            style: context.theme.textTheme.titleSmall!.copyWith(
              color: context.theme.colorScheme.onPrimary,
            ),
          ).setHorizontalPadding(context, 32.w),
        ],
      ),
    );
  }
}
