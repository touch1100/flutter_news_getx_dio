import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/common/routes/app_route.dart';
import 'package:news/global.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (Global.profile.access_token != null
        // ||
        // route == AppRoutes.SIGN_IN ||
        // route == AppRoutes.SIGN_UP ||
        // route == AppRoutes.INITIAL
    ) {
      return null;
    } else {
      Future.delayed(
          Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
