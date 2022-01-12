import 'package:flutter/material.dart';
import 'package:zkfly/app/index.dart';
import 'package:get/get.dart';
import 'package:zkfly/getxviews/zkgetx_pageview.dart';

class ZkGetxFilter extends GetxController with ZkFilter {
  static ZkGetxFilter get to => Get.find();
  ZkGetxFilter();
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

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
}
