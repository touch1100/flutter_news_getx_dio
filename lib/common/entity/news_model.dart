import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

/// 新闻分页 request
 @JsonSerializable()
class NewsPageListRequestEntity {
  String? categoryCode;
  String? channelCode;
  String? tag;
  String? keyword;

  NewsPageListRequestEntity({
    this.categoryCode,
    this.channelCode,
    this.tag,
    this.keyword,
  });

  factory NewsPageListRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$NewsPageListRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewsPageListRequestEntityToJson(this);
}

/// 新闻分页 response
@JsonSerializable()
class NewsPageListResponseEntity {
  int? counts;
  int? pagesize;
  int? pages;
  int? page;
  List<NewsItem>? items;

  NewsPageListResponseEntity({
    this.counts,
    this.pagesize,
    this.pages,
    this.page,
    this.items,
  });

  factory NewsPageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$NewsPageListResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewsPageListResponseEntityToJson(this);
}

@JsonSerializable()
class NewsItem {
  String id;
  String title;
  String category;
  String thumbnail;
  String author;
  DateTime addtime;
  String url;

  NewsItem({
    required this.id,
    required this.title,
    required this.category,
    required this.thumbnail,
    required this.author,
    required this.addtime,
    required this.url,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) =>
      _$NewsItemFromJson(json);

  Map<String, dynamic> toJson() => _$NewsItemToJson(this);
}

/// 新闻推荐 request
@JsonSerializable()
class NewsRecommendRequestEntity {
  String categoryCode;
  String channelCode;
  String tag;
  String keyword;

  NewsRecommendRequestEntity({
    required this.categoryCode,
    required this.channelCode,
    required this.tag,
    required this.keyword,
  });

  factory NewsRecommendRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$NewsRecommendRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewsRecommendRequestEntityToJson(this);
}
/// 频道列表
@JsonSerializable()
class ChannelResponseEntity{
   String code;
   String title;

   ChannelResponseEntity({required this.code,required this.title});
   factory ChannelResponseEntity.fromJson(Map<String, dynamic> json) => _$ChannelResponseEntityFromJson(json);
   Map<String, dynamic> toJson() => _$ChannelResponseEntityToJson(this);

}