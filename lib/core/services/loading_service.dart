import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void configureEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..indicatorSize = 50.0.r
    ..radius = 25.0.r
    ..contentPadding = EdgeInsets.all(25.r)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = const Color(0xffffffff)
    ..indicatorColor = const Color(0xff004182)
    ..textColor = Colors.white
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = const Color(0x54ffffff)
    ..userInteractions = false
    ..dismissOnTap = false;
}
