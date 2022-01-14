import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zkfly/appviews/index.dart';
import 'package:zkfly/getxapp/zk_getx_storager.dart';
import 'package:zkfly/model/index.dart';
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
  ZkFilter insertWidgetListBuilder(ZkValueKey key, WidgetListBuilder builder) {
    actionOf(key).buildWidgetList = builder;
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

  // 用户登录
  Future<int> login(String username, String password) async {
    UserModel.singleton.saveUserInfo(jsonEncode(
        {'username': 'admin', 'jwttoken': 'token', 'tel': '13757151027'}));
    print(UserModel.singleton.getUserInfo());
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

  List<Widget>? widgetListOf(ZkValueKey? key) {
    return actions[key]?.widgetList;
  }

  void onPageChanged(ZkValueKey? key, int index) {}

  // tabController
  TabController? tabControllerOf(ZkValueKey? key,
      {int length = 3, int initialIndex = 0, required TickerProvider vsync}) {
    var c = controllers.putIfAbsent(
      key,
      () => TabController(
          length: length, initialIndex: initialIndex, vsync: vsync),
    );
    return c;
  }
}
