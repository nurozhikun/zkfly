import 'package:flutter/material.dart';
import 'zk_app_filter.dart';

class ZkValueKey extends ValueKey<String> {
  static const keyUsername = ZkValueKey("username");
  static const keyPassword = ZkValueKey("password");
  static const keyLogin = ZkValueKey("login");
  static const keyMainRoute = ZkValueKey("zk_main_route");
  static const keyHomeAppbar = ZkValueKey("zk_home_appbar");
  const ZkValueKey(String s, {this.filter}) : super(s);
  final ZkFilter? filter;
}

mixin ZkValueKeyMixin on Widget {
  ZkValueKey? get zkValueKey {
    if (key is ZkValueKey) {
      return key as ZkValueKey;
    }
    return null;
  }
}
