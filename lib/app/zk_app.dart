import 'package:flutter/material.dart';
import 'index.dart';

class ZkApp {
  ZkShared? shared;

  ThemeData? get theme {
    var i = (null == shared) ? 1 : shared!.themeIndex;
    return themeOf(i);
  }

  set themeIndex(int i) => shared!.themeIndex = i;

  Locale get local => const Locale('zh', 'CH');

  @protected //override by children
  ThemeData? themeOf(int i) => null;
}
