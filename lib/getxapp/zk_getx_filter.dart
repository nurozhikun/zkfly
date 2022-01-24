import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../zkfly.dart';

class ZkGetxFilter extends GetxController
    with ZkFilter, GetSingleTickerProviderStateMixin {
  static ZkGetxFilter get to => Get.find();
  ZkGetxFilter() {
    _initActions();
  }
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
  @override
  String? labelTextOf(ZkValueKey? key) {
    return key?.value.tr;
  }

  // PageController
  @override
  ZkGetxPageController? pageControllerOf(ZkValueKey? key, {int initPage = 0}) {
    if (null == key) {
      return null;
    }
    var c = controllers.putIfAbsent(
      key,
      () => ZkGetxPageController(initialPage: initPage),
    );
    return c;
  }

  //init the default actions
  void _initActions() {
    // actionOf(ZkValueKey.keyLogin)
    //   ..insertOnPressLogin((user, password) {})
    //   ..insertOnValueChangedInt((i) => null);
  }
}
