import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news/common/utils/iconfont.dart';
import 'package:news/common/values/colors.dart';
import 'package:news/pages/application/state.dart';

class ApplicationController extends SuperController {
  ApplicationController();

  final state = ApplicationState();

  // tab 页标题
  late final List<String> tabTitles;

  // 页控制器
  late final PageController pageController;

// 底部导航项目
  late final List<BottomNavigationBarItem> bottomTabs;

  // tab栏动画
  void handleNavBarTap(int index) {
    print('index:$index');
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void handlePageChanged(int page) {
    state.page = page;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabTitles = ['Welcome', 'Category', 'Bookmarks', 'Account'];

    bottomTabs = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
          icon: Icon(
            Iconfont.home,
            color: AppColors.tabBarElement,
          ),
          activeIcon: (Icon(
            Iconfont.home,
            color: AppColors.secondaryElementText,
          )),
          label: 'main',
          tooltip: '',
          backgroundColor: AppColors.primaryBackground),
      new BottomNavigationBarItem(
        icon: Icon(
          Iconfont.grid,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Iconfont.grid,
          color: AppColors.secondaryElementText,
        ),
        label: 'category',
        tooltip: '',
        backgroundColor: AppColors.primaryBackground,
      ),
      new BottomNavigationBarItem(
        icon: Icon(
          Iconfont.tag,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Iconfont.tag,
          color: AppColors.secondaryElementText,
        ),
        label: 'tag',
        tooltip: '',
        backgroundColor: AppColors.primaryBackground,
      ),
      new BottomNavigationBarItem(
        icon: Icon(
          Iconfont.me,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Iconfont.me,
          color: AppColors.secondaryElementText,
        ),
        label: 'my',
        tooltip: '',
        backgroundColor: AppColors.primaryBackground,
      )
    ];
    pageController = new PageController(initialPage: state.page);
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
