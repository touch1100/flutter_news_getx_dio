import 'package:get/get.dart';
import 'package:news/pages/frame/home/home_controller.dart';
import 'package:news/pages/frame/home/home_provider.dart';
import 'package:news/pages/frame/home/widgets/channel/channel_controller.dart';
import 'package:news/pages/frame/home/widgets/newsList/news_controller.dart';
import 'package:news/pages/frame/home/widgets/recommend/recommend_controller.dart';

class HomeStateBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeProvider>(() => HomeProvider());
    Get.lazyPut<RecommendController>(() => RecommendController(provider: Get.find()));
    Get.lazyPut<ChannelController>(() => ChannelController(provider: Get.find()));
    Get.lazyPut<NewsController>(() => NewsController(provider:Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(provider: Get.find()));

    // Get.put(RecommendController(provider: Get.find()));

  }
}
