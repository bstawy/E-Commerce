import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/extensions.dart';

class HomeGridWidget extends StatelessWidget {
  final String title;
  final dynamic gridList;
  final BoxFit? imageFit;

  const HomeGridWidget({
    super.key,
    required this.title,
    required this.gridList,
    this.imageFit,
  });

  @override
  Widget build(BuildContext context) {
    double extraSpace = (16 + 16 + 8);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.theme.textTheme.titleSmall!.copyWith(
                color: context.theme.colorScheme.primary,
              ),
            ),
            GestureDetector(
              onTap: () {
                // TODO: Navigate to all categories screen
              },
              child: Text(
                "View all",
                style: context.theme.textTheme.bodySmall,
              ),
            ),
          ],
        ).setHorizontalPadding(context, 16.w),
        Expanded(
          child: GridView.builder(
            padding:
                EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w, bottom: 0),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 16,
              childAspectRatio:
                  ((MediaQuery.of(context).size.width - extraSpace) / 2) / 150,
            ),
            itemCount: gridList.length,
            itemBuilder: (context, index) => buildGridItem(
              context,
              gridList[index],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildGridItem(BuildContext context, dynamic model) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to selected category screen
      },
      child: Column(
        children: [
          CachedNetworkImage(
            imageBuilder: (context, imageProvider) {
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: imageFit ?? BoxFit.cover,
                  ),
                ),
              );
            },
            imageUrl: model.imageUrl,
            height: 100,
            width: 100,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            model.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
