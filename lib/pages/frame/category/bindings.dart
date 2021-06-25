import 'package:get/get.dart';
import 'package:news/pages/frame/category/controller.dart';
import 'package:news/pages/frame/category/provider.dart';

class NewsStateMixinBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NewsStateMixinProvider>(() => NewsStateMixinProvider());
    Get.lazyPut<NewsStateMixinController>(
        () => NewsStateMixinController(provider: Get.find()));
  }
}
