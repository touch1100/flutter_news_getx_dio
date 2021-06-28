// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    json['email'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

UserRegisterRequestEntity _$UserRegisterRequestEntityFromJson(
    Map<String, dynamic> json) {
  return UserRegisterRequestEntity(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$UserRegisterRequestEntityToJson(
        UserRegisterRequestEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

UserLoginRequestEntity _$UserLoginRequestEntityFromJson(
    Map<String, dynamic> json) {
  return UserLoginRequestEntity(
    json['email'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$UserLoginRequestEntityToJson(
        UserLoginRequestEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

UserLoginResponseEntity _$UserLoginResponseEntityFromJson(
    Map<String, dynamic> json) {
  return UserLoginResponseEntity(
    access_token: json['access_token'] as String?,
    display_name: json['display_name'] as String?,
    channels:
        (json['channels'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$UserLoginResponseEntityToJson(
        UserLoginResponseEntity instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'display_name': instance.display_name,
      'channels': instance.channels,
    };
