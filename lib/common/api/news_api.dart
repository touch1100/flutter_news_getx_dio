import 'package:get/get.dart';
import 'package:news/common/entity/news_model.dart';
import 'package:news/pages/frame/home/home_provider.dart';
import 'package:news/pages/frame/home/home_state.dart';

class NewsApi{
  static Future<void> getChannel(SuperController<HomeStates> controller, HomeProvider provider) async {
    final Response response = await provider.getChannelResponse();
    if (response.hasError) {
      // ignore: invalid_use_of_protected_member
      controller.change(null, status: RxStatus.error(response.statusText));
    } else {
      controller.state!.channel = response.body
          .map<ChannelResponseEntity>(
              (item) => ChannelResponseEntity.fromJson(item))
          .toList();
      // ignore: invalid_use_of_protected_member
      controller.change(controller.state, status: RxStatus.success());
    }
  }
}