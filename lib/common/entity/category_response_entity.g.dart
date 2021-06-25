// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponseEntity _$CategoryResponseEntityFromJson(
    Map<String, dynamic> json) {
  return CategoryResponseEntity(
    code: json['code'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$CategoryResponseEntityToJson(
        CategoryResponseEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
    };
