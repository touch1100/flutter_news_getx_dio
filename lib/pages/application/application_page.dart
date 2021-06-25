import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/common/values/colors.dart';
import 'package:news/pages/application/application_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/pages/frame/category/category_page.dart';
import 'package:news/pages/frame/home/home_page.dart';

class ApplicationPage extends GetView<ApplicationController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _buildHeadView(),
      // body: _buildPageView(),
      body: Obx(() => IndexedStack(
            index: controller.state.page,
            children: _buildPageViews,
          )),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildHeadView() {
    return transparentAppBar(
        title: Obx(
          () => Text(
            controller.tabTitles[controller.state.page],
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Montserrat',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: AppColors.primaryText,
              ))
        ]);
  }

  AppBar transparentAppBar(
      {Widget? title, Widget? leading, List<Widget>? actions}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title != null
          ? Center(
              child: title,
            )
          : null,
      leading: leading,
      actions: actions,
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
          items: controller.bottomTabs,
          currentIndex: controller.state.page,
          type: BottomNavigationBarType.fixed,
          // onTap: controller.handleNavBarTap,
          onTap: controller.handlePageChanged,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ));
  }

  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomePage(),
        CategoryPage(),
        Text('BookmarksPage'),
        Text('AccountPage'),
      ],
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
    );
  }

  final List<Widget> _buildPageViews = [
    HomePage(),
    CategoryPage(),
    Text('BookmarksPage'),
    Text('AccountPage'),
  ];
}
