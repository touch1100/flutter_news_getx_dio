import 'package:get/get.dart';
import 'package:news/pages/frame/welcome/welcome_controller.dart';

class WelcomeBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }

}