import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
   String email;
   String password;

  UserModel(this.email, this.password);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

// 登录请求
@JsonSerializable()
class UserLoginRequestEntity {
  String email;
  String password;

  UserLoginRequestEntity(
     this.email,
     this.password,
  );

  factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginRequestEntityToJson(this);
}
// 登录返回
@JsonSerializable()
class UserLoginResponseEntity {
  String? access_token;
  String? display_name;
  List<String>? channels;

  UserLoginResponseEntity({
    this.access_token,
    this.display_name,
    this.channels,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
     _$UserLoginResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginResponseEntityToJson(this);
}
