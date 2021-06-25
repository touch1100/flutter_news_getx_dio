import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/common/entity/category_response_entity.dart';
import 'package:news/common/values/colors.dart';
import 'package:news/pages/frame/home/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/pages/frame/home/widgets/recommend/recommend_controller.dart';

class NewsCategoriesWidget extends GetView<HomeController> {
  final progressBar = CircularProgressIndicator();
  // final RecommendController myController = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return controller.obx((state) => _buildListView(state!.categories),
        onEmpty: Text('empty)'),
        onLoading: Center(
          child: progressBar,
        ),
        onError: (error) => Text("onError: ${error.toString()}"));
  }

  Widget _buildListView(List<CategoryResponseEntity?> state) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: state.map<Widget>((item) {
          return Container(
            alignment: Alignment.center,
            height: 52.h,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              child: Obx(
                () => Text(
                  item!.title,
                  style: TextStyle(
                    color: controller.state!.selCategoryCode == item.code
                        ? AppColors.secondaryElementText
                        : AppColors.primaryText,
                    fontSize: 18.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                print('code => ${item!.code}');
                controller.asyncLoadNewsData(item.code);
                print(
                    'controller.state.selCategoryCode => ${controller.state!.selCategoryCode}');
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
