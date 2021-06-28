import 'package:get/get.dart';
import 'package:news/pages/frame/sign_up/sign_up_controller.dart';
import 'package:news/pages/frame/sign_up/sign_up_provider.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SignUpProvider>(() => SignUpProvider());
    Get.lazyPut<SignUpController>(() => SignUpController(provider: Get.find()));
  }
}
