import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news/common/routes/app_route.dart';
import 'package:news/global.dart';


/// 第一次欢迎页面
class RouteWelcomeMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (Global.isFirstOpen == true) {
      return null;
    } else if (Global.isOfflineLogin == true) {
      return RouteSettings(name: AppRoutes.APPLICATION);
    } else {
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
