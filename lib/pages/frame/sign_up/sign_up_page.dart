import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/common/values/colors.dart';
import 'package:news/common/widgets/button.dart';
import 'package:news/common/widgets/input.dart';
import 'package:news/common/widgets/toast.dart';
import 'package:news/common/widgets/transparent_app_bar.dart';
import 'package:news/pages/frame/sign_up/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
          leading: IconButton(
              // onPressed: () {
              //   Get.back();
              // },
              onPressed: controller.handleNavSignUpPop,
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.primaryText,
              )),
          actions: <Widget>[
            IconButton(
                // onPressed: () {
                //   toastInfo(msg: '这是注册界面');
                // },
                onPressed: controller.handleSignUpTip,
                icon: Icon(
                  Icons.info_outline,
                  color: AppColors.primaryText,
                ))
          ]),
      body: Center(
        child: Column(
          children: <Widget>[
            Divider(),
            _buildLogo(),
            _buildInput(),
            Spacer(),
            _buildThridPartyLogin(),
            _buildHanveAccountButton()
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 50.h),
      child: Text(
        "Sign up",
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      width: 295.w,
      // height: 204,
      margin: EdgeInsets.only(top: 49.h),
      child: Column(
        children: [
          // fullName input
          inputTextEdit(
            controller: controller.fullnameController,
            keyboardType: TextInputType.text,
            hintText: "Full name",
            marginTop: 0,
          ),
          // email input
          inputTextEdit(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
          ),
          // password input
          inputTextEdit(
            controller: controller.passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            isPassword: true,
          ),

          // 创建
          Container(
            height: 44.h,
            margin: EdgeInsets.only(top: 15.h),
            child: btnFlatButtonWidget(
              onPressed: controller.handleSignUp,
              width: 295.w,
              fontWeight: FontWeight.w600,
              title: "Create an account",
            ),
          ),
          // Spacer(),

          // Fogot password
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: TextButton(
              onPressed: controller.handleFogotPassword,
              child: Text(
                "Fogot password?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  height: 1, // 设置下行高，否则字体下沉
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThridPartyLogin() {
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(bottom: 40.h),
      child: Column(
        children: [
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              children: [
                btnFlatButtonBorderOnlyWidget(
                    onPressed: () {}, iconFileName: "twitter", width: 88),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                    onPressed: () {}, iconFileName: "google", width: 88),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                    onPressed: () {}, iconFileName: "facebook", width: 88),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHanveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: btnFlatButtonWidget(
        onPressed: controller.handleNavSignUpPop,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "I have an account",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }
}
