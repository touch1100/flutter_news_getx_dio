import 'package:get/get.dart';
import 'package:news/common/values/server.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    httpClient.baseUrl = SERVER_API_URL;

    // httpClient.timeout = const Duration(milliseconds: 10);

    // 请求拦截
    httpClient.addRequestModifier<void>((request) {
      request.headers['Authorization'] = '123456';
      return request;
    });
    //响应拦截
    httpClient.addResponseModifier((request, response) {
      print("request.url => ${request.url}");
      print("response.body => ${response.body.toString()}");
      return response;
    });
  }
}
