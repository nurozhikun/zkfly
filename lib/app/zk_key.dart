import 'package:flutter/material.dart';
import 'zk_app_filter.dart';

class ZkValueKey extends ValueKey<String> {
  static const keyUsername = ZkValueKey("username");
  static const keyPassword = ZkValueKey("password");
  static const keyLogin = ZkValueKey("login");
  static const keyHomeRoute = ZkValueKey("home_route");
  static const keyHomeAppbar = ZkValueKey("home_appbar");
  // static const keyLoginAppbar = ZkValueKey("login_appbar");
  // const ZkValueKey(String s) : super(s);
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

typedef VoidCallback = void Function();
typedef IconBuilder = Icon? Function();

class ZkKeyAction {
  ZkKeyAction({
    this.onPressedCallback,
    this.buildPrefixIcon,
  });
  VoidCallback? onPressedCallback;
  IconBuilder? buildPrefixIcon;
  void onPressed() {
    if (onPressedCallback != null) {
      onPressedCallback!();
    }
  }

  Icon? get prefixIcon => (buildPrefixIcon == null) ? null : buildPrefixIcon!();
}
