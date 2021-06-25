import 'package:get/get.dart';
import 'package:news/common/routes/app_route.dart';
import 'package:news/global.dart';
import 'package:news/pages/frame/welcome/state.dart';

class WelcomeController extends SuperController {
  final state = WelcomeState();

  handleNavSignIn() {
    Global.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
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
