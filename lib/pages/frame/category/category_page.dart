import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/common/entity/news_model.dart';
import 'package:news/pages/frame/category/controller.dart';

class CategoryPage extends GetView<NewsStateMixinController> {
  final progressBar = CircularProgressIndicator();

  CategoryPage({Key? key}) : super(key: key) {
    print('init');
    // Timer.periodic(Duration(milliseconds: 3000), (t) {
    //   controller.getNewsPageList();
    //   t.cancel();
    // });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: controller.obx((state) => _buildListView(state),
            onEmpty: Text('empty)'),
            onLoading: Obx(
              () => Center(
                child:
                    controller.states.isShowProgress ? progressBar : Container(),
              ),
            ), onError: (error) {
          controller.changeProgressSate(false);
          return Text("onError: ${error.toString()}");
        }),
      ),
    );
  }

  // Future.delayed(Duration.zero,(){
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return MyDialog(context);
  //       });
  // });

  Widget _buildListView(NewsPageListResponseEntity? state) {
    return ListView.separated(
        controller:controller.scroll,
        itemBuilder: (context, index) {
          final NewsItem item = state!.items![index];
          return ListTile(
            onTap: () {},
            title: Text(item.title),
            trailing: Text("分类 ${item.category}"),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: state != null ? state.items!.length : 0);
  }
}
