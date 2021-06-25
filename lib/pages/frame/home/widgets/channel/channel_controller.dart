import 'package:get/get.dart';
import 'package:news/common/entity/news_model.dart';
import 'package:news/pages/frame/home/home_provider.dart';
import 'package:news/pages/frame/home/home_state.dart';

class ChannelController extends SuperController<HomeStates> {
  HomeProvider provider;

  ChannelController({required this.provider}) {
    value = HomeStates();
  }

  Future<void> getChannel() async {
    final Response response = await provider.getChannelResponse();
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      state!.channel = response.body
          .map<ChannelResponseEntity>(
              (item) => ChannelResponseEntity.fromJson(item))
          .toList();
      change(state, status: RxStatus.success());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getChannel();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
