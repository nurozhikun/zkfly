import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zkfly/appviews/index.dart';
import 'zk_key.dart';

class ZkFilter {
  @protected
  Map controllers = <ZkValueKey, dynamic>{};

  String? labelTextOf(ZkValueKey? key) {
    return key?.value;
  }

  String? hintTextOf(ZkValueKey? key) {
    return key?.value;
  }

  Icon? prefixIconOf(ZkValueKey? key) {}

  Future<int> login(String username, String password) async {
    return 0;
  }

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
