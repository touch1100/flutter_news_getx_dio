import 'package:get/get.dart';
import 'package:news/common/api/news_api.dart';
import 'package:news/common/entity/category_response_entity.dart';
import 'package:news/common/entity/news_model.dart';
import 'package:news/pages/frame/home/home_state.dart';
import 'package:news/pages/frame/home/home_provider.dart';
import 'package:news/pages/frame/home/widgets/channel/channel_controller.dart';
import 'package:news/pages/frame/home/widgets/newsList/news_controller.dart';
import 'package:news/pages/frame/home/widgets/recommend/recommend_controller.dart';

class HomeController extends SuperController<HomeStates> with ScrollMixin{
  final HomeProvider provider;

  // final HomeStates state = HomeStates();

  late RecommendController recommendController;
  late ChannelController channelController;
  late NewsController newsController;

  HomeController({required this.provider}) {
    value = HomeStates();
    recommendController = Get.find();
    channelController = Get.find();
    newsController = Get.find();
  }

  Future<void> getCategories() async {
    final Response response = await provider.getCategory();
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      // var data = CategoryResponseEntity.fromJson(response.body);
      // state.categories = CategoryResponseEntity.fromJson(response.body);
      state!.categories = response.body
          .map<CategoryResponseEntity>(
              (item) => CategoryResponseEntity.fromJson(item))
          .toList();
      change(state, status: RxStatus.success());
    }
  }

  loadAllData() async {
    // state.categories = await getCategories();
    await getCategories();
    state!.selCategoryCode = state!.categories.first.code;
  }

  // 拉取推荐、新闻
  asyncLoadNewsData(
    categoryCode, {
    bool refresh = false,
  }) async {
    state!.selCategoryCode = categoryCode;
    // provider.getRecommend();
    recommendController.getRecommend();
    NewsApi.getChannel(channelController, provider);
    newsController.getNews(false);
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
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadAllData();
  }

  @override
  Future<void> onEndScroll() async {
    // TODO: implement onEndScroll
    print('onEndScroll');
    newsController.getNews(true);
  }

  @override
  Future<void> onTopScroll() async{
    // TODO: implement onTopScroll
    print('onTopScroll');
    recommendController.getRecommend();
    NewsApi.getChannel(channelController, provider);
    newsController.getNews(false);
  }
}
