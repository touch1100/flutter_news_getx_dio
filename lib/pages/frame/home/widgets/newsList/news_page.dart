import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/common/entity/news_model.dart';
import 'package:news/common/utils/date.dart';
import 'package:news/common/values/colors.dart';
import 'package:news/common/widgets/image.dart';
import 'package:news/pages/frame/home/widgets/ad.dart';
import 'package:news/pages/frame/home/widgets/newsList/news_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsPage extends GetView<NewsController> {
  final progressBar = CircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return controller.obx((state) {
      if (state!.newsList == null) {
        return Container();
      } else {
        return _buildList(state.newsList);
      }
    },
        onEmpty: Text('no data'),
        onLoading: progressBar,
        onError: (error) => Text("Error:${error.toString()}"));
  }

  Widget _buildList(List<NewsItem> list) {
    return ListView(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      controller: controller.scroll,
      children: list.map<Widget>((item) {
        ///新闻
        List<Widget> widgets = <Widget>[
          _buildListItem(item),
          Divider(height: 1),
        ];
        int index = list.indexOf(item);
        if (((index + 1) % 5) == 0) {
          widgets.addAll(<Widget>[AdWidget(), Divider(height: 1)]);
        }
        return ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: widgets,
        );
      }).toList(),
    );
  }

  Widget _buildListItem(NewsItem item) {
    return Container(
      height: 161.h,
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              item.thumbnail,
              width: 121.w,
              height: 121.w,
            ),
          ),
          // 右侧
          SizedBox(
            width: 194.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 作者
                Container(
                  margin: EdgeInsets.all(0),
                  child: Text(
                    item.author,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.thirdElementText,
                      fontSize: 14.sp,
                      height: 1,
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
                      item.title,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryText,
                        fontSize: 16.sp,
                        height: 1,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                    ),
                  ),
                ),
                // Spacer
                Spacer(),
                // 一行 3 列
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 分类
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 60.w,
                        ),
                        child: Text(
                          item.category,
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
                        constraints: BoxConstraints(
                          maxWidth: 100.w,
                        ),
                        child: Text(
                          '• ${duTimeLineFormat(item.addtime)}',
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
                          size: 24.sp,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
