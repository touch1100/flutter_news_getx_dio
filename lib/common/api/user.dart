import 'package:news/common/entity/user_model.dart';
import 'package:news/common/utils/http.dart';
import 'package:news/common/values/server.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<UserLoginResponseEntity> login({
    UserLoginRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      LOGIN_API_URL,
      data: params?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }

  /// 注册
  static Future<UserModel> register({
    UserModel? params,
  }) async {
    var response = await HttpUtil().post(
      REGISTER_API_URL,
      data: params?.toJson(),
    );
    return UserModel.fromJson(response);
  }
}
