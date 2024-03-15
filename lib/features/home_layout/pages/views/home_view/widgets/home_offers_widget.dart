import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/extensions.dart';

class HomeOffersWidget extends StatefulWidget {
  const HomeOffersWidget({super.key});

  @override
  State<HomeOffersWidget> createState() => _HomeOffersWidgetState();
}

class _HomeOffersWidgetState extends State<HomeOffersWidget> {
  final PageController _controller = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200.h,
      child: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: const ClampingScrollPhysics(),
            allowImplicitScrolling: true,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: [
              offerWidget("assets/images/offer_item_1.png"),
              offerWidget("assets/images/offer_item_2.png"),
              offerWidget("assets/images/offer_item_3.png"),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: buildDots(),
          ),
        ],
      ),
    );
  }

  Container offerWidget(String offerImagePath) {
    return Container(
      width: double.infinity,
      height: 200.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(offerImagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            width: 10.w,
            height: 10.h,
            margin: const EdgeInsets.only(bottom: 8, right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: i == _currentPageIndex
                  ? context.theme.colorScheme.primary
                  : context.theme.colorScheme.background,
            ),
          ),
      ],
    );
  }
}
