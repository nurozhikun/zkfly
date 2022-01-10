import 'package:flutter/material.dart';
import 'zk_key.dart';

class ZkFilter {
  @protected
  Map controllers = <ZkValueKey, dynamic>{};
  void onPressed(ZkValueKey? key) {
    if (null != key) {
      print(key.value);
    }
  }

  PageController? pageControllerOf(ZkValueKey? key, {int initPage = 0}) {
    var c = controllers.putIfAbsent(
      key,
      () => PageController(initialPage: initPage),
    );
    return c;
  }

  void onPageChanged(ZkValueKey? key, int index) {}
}
