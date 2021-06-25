import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news/common/api/user.dart';
import 'package:news/common/entity/user_model.dart';
import 'package:news/common/routes/app_route.dart';
import 'package:news/common/utils/security.dart';
import 'package:news/common/widgets/toast.dart';
import 'package:news/global.dart';
import 'package:news/pages/frame/sign_in/state.dart';

class SignInController extends SuperController {
  final state = SignInState();

  SignInController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // 跳转 注册界面
  handleNavSignUp() {
    Get.toNamed(AppRoutes.SIGN_UP);
  }

  handleSignIn() async {
    if (emailController.value.text.isNotEmpty &&
        passController.value.text.isNotEmpty) {
      UserLoginRequestEntity params = UserLoginRequestEntity(
          emailController.value.text, duSHA256(passController.value.text));
      UserLoginResponseEntity userLoginResponseEntity =
          await UserAPI.login(params: params);
      print('userLoginResponseEntity = ${userLoginResponseEntity.toJson()}');
      Global.saveProfile(userLoginResponseEntity);
      Get.offAllNamed(AppRoutes.APPLICATION);
    } else {
      toastInfo(msg: '请先输入登录信息');
    }
  }

  // 忘记密码
  handleForgotPassword() {
    toastInfo(msg: '忘记密码');
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

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
