import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../zkfly.dart';
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

  void insertWidgetListBuilder(ZkValueKey key, WidgetListBuilder builder) {
    actionOf(key).buildWidgetList = builder;
  }

  String? labelTextOf(ZkValueKey? key) {
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

  //onPressedCallback 如果有参数，需要调用这个函数
  Function? funcOfPress(ZkValueKey? key) {
    return (null != key) ? actionOf(key).onPressedCallback : null;
  }

  //onValueChangedCallback 如果有参数，需要调用这个函数
  Function? funcOfChanged(ZkValueKey? key) {
    return (null != key) ? actionOf(key).onValueChangedCallback : null;
  }

  void onPressed(ZkValueKey? key) {
    funcOfPress(key)?.call();
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
}
