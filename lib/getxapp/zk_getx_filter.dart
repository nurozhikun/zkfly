import 'package:flutter/material.dart';
import 'package:zkfly/app/index.dart';
import 'package:get/get.dart';
import 'package:zkfly/getxviews/zkgetx_pageview.dart';
import 'package:zkfly/getxviews/zkgetx_tabbar.dart';

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

  // tabController
  @override
  ZkGetxTabController? tabControllerOf(ZkValueKey? key,
      {int length = 3, int initialIndex = 0, required TickerProvider vsync}) {
    var c = controllers.putIfAbsent(
      key,
      () => ZkGetxTabController(
          length: length, initialIndex: initialIndex, vsync: vsync),
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
