import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news/common/entity/user_models.dart';
import 'package:news/common/utils/security.dart';
import 'package:news/common/widgets/toast.dart';
import 'package:news/pages/frame/sign_up/sign_up_provider.dart';
import 'package:news/pages/frame/sign_up/state.dart';

class SignUpController extends SuperController {
  SignUpProvider provider;
  final SignUpState state = SignUpState();

  SignUpController({required this.provider});

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // 返回上一页
  handleNavSignUpPop() {
    Get.back();
  }

  // 提示信息
  handleSignUpTip() {
    toastInfo(msg: '这是注册界面');
  }

  // 忘记密码
  handleFogotPassword() {
    toastInfo(msg: '忘记密码');
  }

  // 执行注册操作
  handleSignUp() async {
    if (fullnameController.value.text.isEmpty) {
      toastInfo(msg: '用户名不能为空');
      return;
    }
    if (emailController.value.text.isEmpty) {
      toastInfo(msg: '邮件不能为空');
      return;
    }
    if (passController.value.text.isEmpty) {
      toastInfo(msg: '密码不能为空');
      return;
    }

    UserRegisterRequestEntity params = UserRegisterRequestEntity(
      email: emailController.value.text,
      password: duSHA256(passController.value.text),
    );
    signUp(params);
  }

  Future<void> signUp(UserRegisterRequestEntity params) async {
    final Response response = await provider.register(params);
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      change(state, status: RxStatus.success());
      Get.back();
    }
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
