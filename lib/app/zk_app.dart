import 'package:flutter/material.dart';
import 'index.dart';

class ZkApp {
  ThemeData? get theme {
    // var i = (null == shared) ? 0 : shared!.themeIndex;
    print("theme in zkapp");
    int? i = shared?.themeIndex;
    i ??= 0;
    return themeOf(i);
  }

  set themeIndex(int i) => shared!.themeIndex = i;

  ZkShared? get shared => null;
  Locale get local => const Locale('zh', 'CH');

  @protected //override by children
  ThemeData? themeOf(int i) => null;
}
