import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/services/shimmer_skeleton_service.dart';

class CategoriesShimmerLoadingWidget extends StatelessWidget {
  const CategoriesShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey[100]!,
      child: Skeleton(
        width: 150.w,
        height: MediaQuery.sizeOf(context).height - 250.h,
      ),
    );
  }
}
