import 'package:get/get.dart';
import 'package:news/common/entity/news_model.dart';
import 'package:news/pages/frame/home/home_provider.dart';
import 'package:news/pages/frame/home/home_state.dart';

class NewsController extends SuperController<HomeStates> with ScrollMixin{
  HomeProvider provider;


  NewsController({required this.provider}){
    value = HomeStates();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNews(false);
  }
  Future<void> getNews(bool isLoadMore) async{
    final Response response = await provider.getNewsList();
    if(response.hasError){
      change(null, status: RxStatus.error(response.statusText));
    }else{
      state!.newsPageList = NewsPageListResponseEntity.fromJson(response.body);
      if(isLoadMore){
        state!.newsList = state!.newsPageList.items;
      }else{
        state!.resetList(state!.newsPageList.items);
      }

      change(state, status: RxStatus.success());
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