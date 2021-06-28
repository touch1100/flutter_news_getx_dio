import 'package:get/get.dart';
import 'package:news/common/utils/base_provider.dart';
import 'package:news/common/values/server.dart';

class SignUpProvider extends BaseProvider{
    Future<Response> register(dynamic body) async{
      return post(REGISTER_API_URL, body);
      // return get(REGISTER_API_URL);
    }
}