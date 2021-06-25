import 'package:get/get.dart';

class CategoryState {
  final _isShowProgress = true.obs;

  set isShowProgress(value) => this._isShowProgress.value = value;

  get isShowProgress => this._isShowProgress.value;
}
