import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../core/services/shimmer_skeleton_service.dart';

class SubCategoriesShimmerLoadingWidget extends StatelessWidget {
  const SubCategoriesShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Skeleton(
            width: 220.w,
            height: 95.h,
          ),
          SizedBox(
            width: 220.w,
            height: MediaQuery.sizeOf(context).height - 310.h,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 16.h),
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, index) => Row(
                children: [
                  Column(
                    children: [
                      Skeleton(height: 70.h, width: 100.w),
                      SizedBox(height: 8.h),
                      Skeleton(height: 20.h, width: 75.w),
                    ],
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    children: [
                      Skeleton(height: 70.h, width: 100.w),
                      SizedBox(height: 8.h),
                      Skeleton(height: 20.h, width: 75.w),
                    ],
                  ),
                ],
              ).setOnlyPadding(context, 0, 16.h, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
