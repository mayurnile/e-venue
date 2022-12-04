import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(builder: (HomeController controller) {
      return SizedBox(
        height: size.height * 0.09,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // home
            _NavBarItem(
              myIndex: 0,
              title: "Home",
              icon: ImageAssets.nHome,
              isSelected: controller.selectedPage == 0,
            ),
            // saved
            _NavBarItem(
              myIndex: 1,
              title: "Saved",
              icon: ImageAssets.nSaved,
              isSelected: controller.selectedPage == 1,
            ),
            // e-invite
            _NavBarItem(
              myIndex: 2,
              title: "E-Invite",
              icon: ImageAssets.nEinvite,
              isSelected: controller.selectedPage == 2,
            ),
            // profile
            _NavBarItem(
              myIndex: 3,
              title: "Profile",
              icon: ImageAssets.nProfile,
              isSelected: controller.selectedPage == 3,
            ),
          ],
        ),
      );
    });
  }
}

class _NavBarItem extends StatelessWidget {
  final int myIndex;
  final String title;
  final String icon;
  final bool isSelected;

  const _NavBarItem({
    required this.myIndex,
    required this.title,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => locator.get<HomeController>().updateSelectedPage(myIndex),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // icon
          SvgPicture.asset(
            icon,
            height: 24.0,
            width: 24.0,
            color: isSelected ? AppTheme.primaryColor : AppTheme.unselectedColor,
          ),
          // title
          AnimatedDefaultTextStyle(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            style: textTheme.headline4!.copyWith(
              fontWeight: FontWeight.w500,
              color: isSelected ? AppTheme.primaryColor : AppTheme.unselectedColor,
              fontSize: isSelected ? 15.0 : 13.0,
            ),
            child: Text(title),
          ),
          // selector
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 400),
            width: isSelected ? 22.0 : 0.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
          // spacing
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
