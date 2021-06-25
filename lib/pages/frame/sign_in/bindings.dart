import 'package:get/get.dart';
import 'package:news/pages/frame/sign_in/sign_in_controller.dart';

class SignInBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }

}