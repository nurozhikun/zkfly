import 'package:flutter/material.dart';
import 'zk_app_filter.dart';

class ZkValueKey extends ValueKey<String> {
  static const keyHomeRoute = ZkValueKey("home_route");
  static const keyHomeAppbar = ZkValueKey("home_appbar");
  static const keyLogin = ZkValueKey("login");
  static const keyMainPage = ZkValueKey("main_page");
  static const keyPassword = ZkValueKey("password");
  static const keyUsername = ZkValueKey("username");
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
typedef NavigationPageBuilder = List<Widget>? Function();

class ZkKeyAction {
  ZkKeyAction(
      {this.onPressedCallback, this.buildPrefixIcon, this.buildNavigationPage});
  VoidCallback? onPressedCallback;
  IconBuilder? buildPrefixIcon;
  NavigationPageBuilder? buildNavigationPage;
  void onPressed() {
    if (onPressedCallback != null) {
      onPressedCallback!();
    }
  }

  Icon? get prefixIcon => (buildPrefixIcon == null) ? null : buildPrefixIcon!();

  // buildNavigationPage
  List<Widget>? get navigationPage =>
      (buildNavigationPage == null) ? null : buildNavigationPage!();
}
