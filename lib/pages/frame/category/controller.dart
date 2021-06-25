import 'dart:async';

import 'package:get/get.dart';
import 'package:news/common/entity/news_model.dart';
import 'package:news/pages/frame/category/category_state.dart';
import 'package:news/pages/frame/category/provider.dart';

class NewsStateMixinController extends GetxController
    with StateMixin<NewsPageListResponseEntity>, ScrollMixin {
  final NewsStateMixinProvider provider;

  final CategoryState states = CategoryState();

  NewsStateMixinController({required this.provider});

  Future<void> getNewsPageList() async {
    final Response response = await provider.getNews();
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      var data = NewsPageListResponseEntity.fromJson(response.body);
      change(data, status: RxStatus.success());
    }
  }
  changeProgressSate(bool isShow){
    this.states.isShowProgress = isShow;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('NewsStateMixinController onInit');
    // Timer.periodic(Duration(milliseconds: 3000), (t) {
    //   this.getNewsPageList();
    //   t.cancel();
    // });
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print('NewsStateMixinController onReady');
    Timer.periodic(Duration(milliseconds: 3000), (t) {
      this.getNewsPageList();
      t.cancel();
    });
  }

  @override
  Future<void> onEndScroll() async {
    // TODO: implement onEndScroll
    print('onEndScroll');
  }

  @override
  Future<void> onTopScroll() async{
    // TODO: implement onTopScroll
    print('onTopScroll');
  }
}
