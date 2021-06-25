import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:news/common/entity/category_response_entity.dart';
import 'package:news/common/entity/news_model.dart';

class HomeStates{
  ///分类
  var _categories = Rx<List<CategoryResponseEntity>?>(null);
  set categories(value) => _categories.value = value;
  get categories => _categories.value;

  /// 选中的分类Code
  var _selCategoryCode = "".obs;
  set selCategoryCode(value) => _selCategoryCode.value = value;
  get selCategoryCode => _selCategoryCode.value;


  /// 新闻推荐
  var _recommend = Rx<NewsItem?>(null);
  set recommend(value) => _recommend.value = value;
  get recommend => _recommend.value;

  ///频道列表
  var _channel = Rx<List<ChannelResponseEntity>?>(null);
  set channel(value) => _channel.value = value;
  get channel => _channel.value;

  ///新闻翻页
  var _newsPageList = Rx<NewsPageListResponseEntity?>(null);
  set newsPageList(value) => _newsPageList.value = value;
  get newsPageList => _newsPageList.value;
  ///新闻列表
  var _newsList = Rx<List<NewsItem>?>([]);
  set newsList(value){
    _newsList.value!.addAll(value);
    // if(_newsList.value != null){
    // }else{
    //   _newsList.value = value;
    // }
  }
  get newsList => _newsList.value;
  void resetList(List<NewsItem> values){
    _newsList.value = values;
  }

}