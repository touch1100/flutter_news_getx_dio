import 'package:json_annotation/json_annotation.dart';

part 'category_response_entity.g.dart';

/// 新闻分类 response
@JsonSerializable()
class CategoryResponseEntity {
  String code;
  String title;

  CategoryResponseEntity({
    required this.code,
    required this.title,
  });

  factory CategoryResponseEntity.fromJson(Map<String, dynamic> json) => _$CategoryResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseEntityToJson(this);

}
