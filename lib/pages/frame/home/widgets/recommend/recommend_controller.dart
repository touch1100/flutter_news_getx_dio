import 'package:get/get.dart';
import 'package:news/common/entity/news_model.dart';
import 'package:news/pages/frame/home/home_provider.dart';
import 'package:news/pages/frame/home/home_state.dart';

class RecommendController extends SuperController<HomeStates>{
  final HomeProvider provider;
  // final HomeStates state = HomeStates();

  RecommendController({required this.provider}){
    value = HomeStates();
  }

  Future<void> getRecommend() async {
    print('getRecommend');
    final Response response = await provider.getRecommend();
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      state!.recommend = NewsItem.fromJson(response.body);
      change(state, status: RxStatus.success());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRecommend();
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