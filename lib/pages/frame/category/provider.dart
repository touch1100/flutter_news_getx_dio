
import 'package:get/get.dart';
import 'package:news/common/utils/base_provider.dart';
import 'package:news/common/values/server.dart';

abstract class INewsProvider{
  Future<Response> getNews();
}

class NewsStateMixinProvider extends BaseProvider implements INewsProvider{
  @override
  Future<Response> getNews() {
    // TODO: implement getNews
    return get(CATEGORY_NEWS_URL);
  }
}