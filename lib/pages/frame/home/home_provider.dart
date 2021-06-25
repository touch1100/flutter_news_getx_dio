import 'package:get/get.dart';
import 'package:news/common/utils/base_provider.dart';
import 'package:news/common/values/server.dart';

class HomeProvider extends BaseProvider{
  Future<Response> getCategory(){
    return get(HOME_CATEGORY_NEWS_URL);
  }
  Future<Response> getChannelResponse(){
    return get(HOME_CHANNELS_URL);
  }
  Future<Response> getRecommend(){
    return get(HOME_RECOMMEND_URL);
  }
  Future<Response> getNewsList(){
    return get(NEWS_LIST);
  }
}