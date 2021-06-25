import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/common/entity/news_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/utils/date.dart';
import 'package:news/common/values/colors.dart';
import 'package:news/common/widgets/image.dart';
import 'package:news/pages/frame/home/widgets/recommend/recommend_controller.dart';

class RecommendWidget extends GetView<RecommendController> {
  final progressBar = CircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return controller.obx((state) {
      return _buildRecommendView(state!.recommend);},
        onEmpty: Text('empty)'),
        onLoading: Center(
          child: progressBar,
        ),
        onError: (error) => Text("onError: ${error.toString()}"));
  }
  Widget _buildRecommendView(NewsItem? state){
    return Container(
      margin: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 图
          InkWell(
            onTap: () {
              // ExtendedNavigator.rootNavigator.pushNamed(
              //   Routes.detailsPageRoute,
              //   arguments: DetailsPageArguments(item: item),
              // );
            },
            child: netImageCached(
              controller.state!.recommend.thumbnail,
              width: 335.w,
              height: 290.h,
            ),
            // child: Image.network(
            //   controller.state.recommend.thumbnail,
            //   width: 335.w,
            //   height: 290.h,
            // ),
          ),
          // 作者
          Container(
            margin: EdgeInsets.only(top: 14.h),
            child: Text(
              controller.state!.recommend.author,
              style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal,
                color: AppColors.thirdElementText,
                fontSize: 14.sp,
              ),
            ),
          ),
          // 标题
          InkWell(
            onTap: () {
              // ExtendedNavigator.rootNavigator.pushNamed(
              //   Routes.detailsPageRoute,
              //   arguments: DetailsPageArguments(item: item),
              // );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Text(
                controller.state!.recommend.title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                  fontSize: 24.sp,
                  height: 1,
                ),
              ),
            ),
          ),
          // 一行 3 列
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // 分类
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 120,
                  ),
                  child: Text(
                    controller.state!.recommend.category,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.secondaryElementText,
                      fontSize: 14.sp,
                      height: 1,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
                // 添加时间
                Container(
                  width: 15.w,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 120,
                  ),
                  child: Text(
                    '• ${duTimeLineFormat(controller.state!.recommend.addtime)}',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.thirdElementText,
                      fontSize: 14.sp,
                      height: 1,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
                // 更多
                Spacer(),
                InkWell(
                  child: Icon(
                    Icons.more_horiz,
                    color: AppColors.primaryText,
                    size: 24,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}