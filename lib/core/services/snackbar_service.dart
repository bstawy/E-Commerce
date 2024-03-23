import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackBarService {
  static void showSuccessMessage(BuildContext context, String msg) {
    BotToast.showCustomNotification(
      useSafeArea: false,
      crossPage: true,
      dismissDirections: [DismissDirection.endToStart],
      duration: const Duration(
        seconds: 2,
      ),
      toastBuilder: (void Function() cancelFunc) {
        return _buildNotificationWidget(context, "success", msg);
      },
    );
  }

  static void showErrorMessage(BuildContext context, String msg) {
    BotToast.showCustomNotification(
      useSafeArea: false,
      crossPage: true,
      dismissDirections: [DismissDirection.endToStart],
      duration: const Duration(
        seconds: 2,
      ),
      toastBuilder: (void Function() cancelFunc) {
        return _buildNotificationWidget(context, "error", msg);
      },
    );
  }

  static Widget _buildNotificationWidget(
    BuildContext context,
    String state,
    String msg,
  ) {
    final theme = Theme.of(context);

    Color msgColor = (state == "success")
        ? theme.colorScheme.primary
        : theme.colorScheme.error;

    return IntrinsicHeight(
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 52.h, left: 24.w, right: 24.w),
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: const Color(0xffd7d7d7),
          borderRadius: BorderRadius.circular(15.r),
        ),
        alignment: Alignment.center,
        child: Text(
          msg,
          textAlign: TextAlign.center,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleSmall!.copyWith(
            color: msgColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
