import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final int myIndex;
  final String icon;
  final bool isSelected;

  const CategoryCard({
    required this.title,
    required this.myIndex,
    required this.icon,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        locator.get<HomeController>().updateSelectedCategory(myIndex);
        locator.get<HomeController>().getAllVenues(isRefresh: true);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // icon illustration
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: size.height * 0.15,
            width: size.height * 0.15,
            margin: const EdgeInsets.only(left: 2.0, top: 8.0, bottom: 8.0, right: 12.0),
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: isSelected ? AppTheme.primaryColor : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryLightColor.withOpacity(0.1),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Image.asset(icon),
          ),
          // title
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: textTheme.headline4!.copyWith(
              fontWeight: FontWeight.w600,
              color: isSelected ? AppTheme.primaryColor : AppTheme.primaryLightColor,
              fontSize: isSelected ? 15.0 : 13.0,
            ),
            child: Text(title),
          )
        ],
      ),
    );
  }
}
