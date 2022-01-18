import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../zkfly.dart';

class ZkGetxTheme {
  Map<ZkValueKey, ThemeData>? _keys = <ZkValueKey, ThemeData>{};
  ZkGetxTheme(Map<ZkValueKey, ThemeData>? ex) {
    _keys = ex;
  }
  @override
  Future<void> init() async {
    onInitTheme();
  }

  /// 主题
  // 初始化
  void onInitTheme() {
    String code = ZkGetxStorage.to.getString(ZkValueKey.keyTheme.value);
    if (code.isEmpty) {
      print(_keys);
      print(jsonEncode(_keys![ZkValueKey.keyThemeIndigo]));
      // ZkGetxStorage.to.setString(ZkValueKey.keyTheme.value,
      //     jsonEncode(_keys![ZkValueKey.keyThemeIndigo]));
      // setString(ZkValueKey.keyTheme.value,
      //     jsonEncode(ZkGetxFilter.to.themeDataOf(ZkValueKey.keyThemeIndigo)));
      // theme = ZkGetxFilter.to.themeDataOf(key);
    } else {
      // ZkGetxStorage.to.remove(ZkValueKey.keyTheme.value);
      // theme = themeMap[code]!;
    }
  }
}
