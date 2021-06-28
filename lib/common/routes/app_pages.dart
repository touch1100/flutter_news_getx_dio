import 'package:get/get.dart';
import 'package:news/common/middlewares/router_auth.dart';
import 'package:news/common/middlewares/router_welcome.dart';
import 'package:news/common/routes/app_route.dart';
import 'package:news/pages/application/application_page.dart';
import 'package:news/pages/application/bindings.dart';
import 'package:news/pages/frame/category/bindings.dart';
import 'package:news/pages/frame/home/bindings.dart';
import 'package:news/pages/frame/sign_in/sign_in.dart';
import 'package:news/pages/frame/sign_in/bindings.dart';
import 'package:news/pages/frame/sign_up/bindings.dart';
import 'package:news/pages/frame/sign_up/sign_up_page.dart';
import 'package:news/pages/frame/welcome/bindings.dart';
import 'package:news/pages/frame/welcome/welcome.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
        name: AppRoutes.SIGN_IN,
        page: () => SignInPage(),
        binding: SignInBinding()),
    GetPage(
        name: AppRoutes.SIGN_UP,
        page: () => SignUpPage(),
        binding: SignUpBinding()),
    GetPage(
        name: AppRoutes.APPLICATION,
        page: () => ApplicationPage(),
        bindings: [
          ApplicationBinding(),
          NewsStateMixinBinding(),
          HomeStateBinding()
        ],
        middlewares: [
          RouteAuthMiddleware(priority: 1),
        ]),
  ];
}
