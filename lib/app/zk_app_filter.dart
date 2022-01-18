import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'zk_key.dart';

class ZkFilter {
  @protected
  Map controllers = <ZkValueKey, dynamic>{};
  @protected
  Map<ZkValueKey, ZkKeyAction> actions = <ZkValueKey, ZkKeyAction>{};

  ZkKeyAction actionOf(ZkValueKey key) =>
      actions.putIfAbsent(key, () => ZkKeyAction());
  void insertOnPressed(ZkValueKey key, Function onPressed) {
    actionOf(key).onPressedCallback = onPressed;
  }

  void insertPrefixIconBuilder(ZkValueKey key, IconBuilder builder) {
    actionOf(key).buildPrefixIcon = builder;
  }

  // navigationPage
  void insertWidgetListBuilder(ZkValueKey key, WidgetListBuilder builder) {
    actionOf(key).buildWidgetList = builder;
  }

  // theme
  void insertThemeBuilder(ZkValueKey key, ThemeBuilder builder) {
    actionOf(key).buildTheme = builder;
  }

  String? labelTextOf(ZkValueKey? key) {
    print(key?.value);
    return key?.value.tr;
  }

  String? hintTextOf(ZkValueKey? key) {
    return key?.value;
  }

  Icon? prefixIconOf(ZkValueKey? key) {
    return actions[key]?.prefixIcon;
  }

  // // 用户登录
  // Future<int> login(String username, String password) async {
  //   // UserModel.singleton.saveUserInfo(jsonEncode(
  //   //     {'username': 'admin', 'jwttoken': 'token', 'tel': '13757151027'}));
  //   // print(UserModel.singleton.getUserInfo());
  //   return 0;
  // }

  // 服务器测试
  Future<int> serverTest(ZkValueKey? key, String ip, String port) async {
    print(ip + ':' + port);
    if (key == ZkValueKey.keyMainServer) {
    } else if (key == ZkValueKey.keyAreaServer) {}
    return 0;
  }

  // 服务器保存
  Future<int> serverSave(ZkValueKey? key, String ip, String port) async {
    print(ip + ':' + port);
    return 0;
  }

  Function? funcOfPress(ZkValueKey? key) {
    return (null != key) ? actionOf(key).onPressedCallback : null;
  }

  Function? funcOfChanged(ZkValueKey? key) {
    return (null != key) ? actionOf(key).onValueChangedCallback : null;
  }

  void onPressed(ZkValueKey? key, {Map<String, dynamic>? params}) {
    print(key);
    if (null != key) {
      actionOf(key).onPressed(params);
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

  // 主题
  ThemeData? themeDataOf(ZkValueKey? key) {
    return actions[key]?.themeData;
  }
}
