import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/common/values/colors.dart';
import 'package:news/common/values/radii.dart';
import 'package:news/pages/frame/welcome/welcome_controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: (60 + 40).h),
        child: Column(
          children: [
            _buildHeadTitle(),
            _buildHeadDetail(),
            _buildContent(
                "feature-1.png",
                "Compelling photography and typography provide a beautiful reading",
                80.h),
            _buildContent(
              "feature-2.png",
              "Sector news never shares your personal data with advertisers or publishers",
              40,
            ),
            _buildContent(
              "feature-3.png",
              "You can get Premium to unlock hundreds of publications",
              40,
            ),
            Spacer(),
            _buildBottomStart(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(String imgUrl, String content, double marginTop) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            child: Image.asset(
              "assets/images/$imgUrl",
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          Container(
            width: 200.w,
            child: Text(
              content,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeadTitle() {
    return Container(
      alignment: Alignment.center,
      // margin: EdgeInsets.only(top: 60),
      child: Text(
        "Features",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            height: 1),
      ),
    );
  }

  Widget _buildHeadDetail() {
    return Container(
      width: 242.w,
      height: 70.h,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 14.h),
      child: Text(
        "The best of news channels all in one place. Trusted sources and personalized news for you.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.normal,
          fontSize: 16.sp,
          height: 1.3,
        ),
      ),
    );
  }
  Widget _buildBottomStart(BuildContext context) {
    return Container(
      width: 295.w,
      height: 44.h,
      margin: EdgeInsets.only(bottom: 20.h),
      child: TextButton(
        child: Text(
          'Get started',
        ),
        onPressed: controller.handleNavSignIn,
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16.sp)),
          foregroundColor: MaterialStateProperty.resolveWith(
                (states) {
              if (states.contains(MaterialState.focused) &&
                  !states.contains(MaterialState.pressed)) {
                return Colors.blue;
              } else if (states.contains(MaterialState.pressed)) {
                return Colors.deepPurple;
              }
              return AppColors.primaryElementText;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue[200];
            }
            return AppColors.primaryElement;
          }),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: Radii.k6pxRadius,
          )),
        ),
      ),
    );
  }
}


