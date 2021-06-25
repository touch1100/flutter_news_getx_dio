import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/pages/frame/home/home_controller.dart';
import 'package:news/pages/frame/home/widgets/categories/news_categories_widget.dart';
import 'package:news/pages/frame/home/widgets/channel/channel_page.dart';
import 'package:news/pages/frame/home/widgets/newsList/news_page.dart';
import 'package:news/pages/frame/home/widgets/recommend/recommend.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return SingleChildScrollView(
    //   child: Container(
    //     child: Column(
    //       children: [
    //         NewsCategoriesWidget(),
    //         Divider(height: 1),
    //         RecommendWidget(),
    //         Divider(height: 1),
    //         ChannelsPage(),
    //         Divider(height: 1),
    //         NewsPage(),
    //       ],
    //     ),
    //   ),
    // );
    // return NewsPage();
    return controller.obx((state) =>
        ListView(
          controller: controller.scroll,
          children: [
            NewsCategoriesWidget(),
            Divider(height: 1),
            RecommendWidget(),
            Divider(height: 1),
            ChannelsPage(),
            Divider(height: 1),
            NewsPage(),
          ],
        ));
    // return ListView(
    //   controller: controller,
    //   children: [
    //     NewsCategoriesWidget(),
    //     Divider(height: 1),
    //     RecommendWidget(),
    //     Divider(height: 1),
    //     ChannelsPage(),
    //     Divider(height: 1),
    //     NewsPage(),
    //   ],
    // );
  }

}