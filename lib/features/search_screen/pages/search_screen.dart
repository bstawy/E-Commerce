import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/search_app_bar_widget.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget? searchedItemWidget() {
      return GestureDetector(
        onTap: () {
          // Navigator.pushNamed(
          //   context,
          //   DetailsScreen.routeName,
          //   arguments: [context, organ],
          // );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h),
          child: Text(
            "",
            style: theme.textTheme.labelMedium,
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SearchAppBarWidget(),
          _searchTextController.text.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      SizedBox(height: 300.h),
                      Text(
                        "Search for organs",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height - 200,
                          child: ListView.builder(
                            //itemCount: searchedOrgans.length,
                            itemBuilder: (context, index) =>
                                searchedItemWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
