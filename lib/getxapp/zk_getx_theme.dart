import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../zkfly.dart';

class ZkGetxTheme extends GetxService {
  final _keys = <ZkValueKey, ThemeData>{};
  ZkGetxTheme(Map<ZkValueKey, ThemeData>? ex) {
    append(ex);
  }
  Map<ZkValueKey, ThemeData> get getTheme => _keys;
  void append(Map<ZkValueKey, ThemeData>? ex) {
    print('**************************************');
    print(ex);
    // ex?.forEach((String, String> v) {
    //   if (_keys.containsKey(k)) {
    //     _keys[k]?.addAll(v);
    //   } else {
    //     _keys[k] = v;
    //   }
    // });
  }

  @override
  Future<void> init() async {
    print('object');
  }

  /// 主题
  // 初始化
  void onInitTheme() {
    String code = ZkGetxStorage.to.getString(ZkValueKey.keyTheme.value);
    if (code.isEmpty) {
      print('********************');
      // print(ZkGetxFilter.to.actions);
      // setString(ZkValueKey.keyTheme.value,
      //     jsonEncode(ZkGetxFilter.to.themeDataOf(ZkValueKey.keyThemeIndigo)));
      // theme = ZkGetxFilter.to.themeDataOf(key);
    } else {
      ZkGetxStorage.to.remove(ZkValueKey.keyTheme.value);
      // theme = themeMap[code]!;
    }
  }
}
