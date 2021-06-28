// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsPageListRequestEntity _$NewsPageListRequestEntityFromJson(
    Map<String, dynamic> json) {
  return NewsPageListRequestEntity(
    categoryCode: json['categoryCode'] as String?,
    channelCode: json['channelCode'] as String?,
    tag: json['tag'] as String?,
    keyword: json['keyword'] as String?,
  );
}

Map<String, dynamic> _$NewsPageListRequestEntityToJson(
        NewsPageListRequestEntity instance) =>
    <String, dynamic>{
      'categoryCode': instance.categoryCode,
      'channelCode': instance.channelCode,
      'tag': instance.tag,
      'keyword': instance.keyword,
    };

NewsPageListResponseEntity _$NewsPageListResponseEntityFromJson(
    Map<String, dynamic> json) {
  return NewsPageListResponseEntity(
    counts: json['counts'] as int?,
    pagesize: json['pagesize'] as int?,
    pages: json['pages'] as int?,
    page: json['page'] as int?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => NewsItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NewsPageListResponseEntityToJson(
        NewsPageListResponseEntity instance) =>
    <String, dynamic>{
      'counts': instance.counts,
      'pagesize': instance.pagesize,
      'pages': instance.pages,
      'page': instance.page,
      'items': instance.items,
    };

NewsItem _$NewsItemFromJson(Map<String, dynamic> json) {
  return NewsItem(
    id: json['id'] as String,
    title: json['title'] as String,
    category: json['category'] as String,
    thumbnail: json['thumbnail'] as String,
    author: json['author'] as String,
    addtime: DateTime.parse(json['addtime'] as String),
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$NewsItemToJson(NewsItem instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'thumbnail': instance.thumbnail,
      'author': instance.author,
      'addtime': instance.addtime.toIso8601String(),
      'url': instance.url,
    };

NewsRecommendRequestEntity _$NewsRecommendRequestEntityFromJson(
    Map<String, dynamic> json) {
  return NewsRecommendRequestEntity(
    categoryCode: json['categoryCode'] as String,
    channelCode: json['channelCode'] as String,
    tag: json['tag'] as String,
    keyword: json['keyword'] as String,
  );
}

Map<String, dynamic> _$NewsRecommendRequestEntityToJson(
        NewsRecommendRequestEntity instance) =>
    <String, dynamic>{
      'categoryCode': instance.categoryCode,
      'channelCode': instance.channelCode,
      'tag': instance.tag,
      'keyword': instance.keyword,
    };

ChannelResponseEntity _$ChannelResponseEntityFromJson(
    Map<String, dynamic> json) {
  return ChannelResponseEntity(
    code: json['code'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$ChannelResponseEntityToJson(
        ChannelResponseEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
    };
