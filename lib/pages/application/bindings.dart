import 'package:get/get.dart';
import 'package:news/pages/application/application_controller.dart';

class ApplicationBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ApplicationController>(() => ApplicationController());
  }

}