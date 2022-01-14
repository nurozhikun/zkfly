import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zkfly/appviews/index.dart';
import 'zk_key.dart';

class ZkFilter {
  @protected
  Map controllers = <ZkValueKey, dynamic>{};
  @protected
  Map<ZkValueKey, ZkKeyAction> actions = <ZkValueKey, ZkKeyAction>{};

  ZkKeyAction actionOf(ZkValueKey key) =>
      actions.putIfAbsent(key, () => ZkKeyAction());
  ZkFilter insertOnPressed(ZkValueKey key, VoidCallback onPressed) {
    actionOf(key).onPressedCallback = onPressed;
    return this;
  }

  ZkFilter insertPrefixIconBuilder(ZkValueKey key, IconBuilder builder) {
    actionOf(key).buildPrefixIcon = builder;
    return this;
  }

  // navigationPage
  ZkFilter insertNavigationPageBuilder(
      ZkValueKey key, NavigationPageBuilder builder) {
    actionOf(key).buildNavigationPage = builder;
    return this;
  }

  String? labelTextOf(ZkValueKey? key) {
    return key?.value;
  }

  String? hintTextOf(ZkValueKey? key) {
    return key?.value;
  }

  Icon? prefixIconOf(ZkValueKey? key) {
    return actions[key]?.prefixIcon;
  }

  Future<int> login(String username, String password) async {
    return 0;
  }

  void onPressed(ZkValueKey? key) {
    if (null != key) {
      actionOf(key).onPressed();
    }
  }

  PageController? pageControllerOf(ZkValueKey? key, {int initPage = 0}) {
    var c = controllers.putIfAbsent(
      key,
      () => PageController(initialPage: initPage),
    );
    return c;
  }

  List<Widget>? navigationPageOf(ZkValueKey? key) {
    return actions[key]?.navigationPage;
  }

  void onPageChanged(ZkValueKey? key, int index) {}
}
