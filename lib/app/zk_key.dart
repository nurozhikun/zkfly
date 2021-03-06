import 'package:flutter/material.dart';
import 'zk_app_filter.dart';

class ZkValueKey extends ValueKey<String> {
  // theme
  static const keyTheme = ZkValueKey("theme");
  // language
  static const keyLanguage = ZkValueKey("language");
  // home
  static const keyHomeRoute = ZkValueKey("home_route");
  static const keyHomeAppbar = ZkValueKey("home_appbar");
  // user
  static const keyUsername = ZkValueKey("username");
  static const keyPassword = ZkValueKey("password");
  static const keyLogin = ZkValueKey("login");
  // local
  static const keyLocal = ZkValueKey("local");
  static const keySetting = ZkValueKey("setting");
  static const keyAdmin = ZkValueKey("admin");
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

typedef VoidCallback = void Function(Map<String, dynamic>? params);
typedef IconBuilder = Icon? Function();
typedef WidgetListBuilder = List<Widget>? Function();
typedef ThemeBuilder = ThemeData? Function();

class ZkKeyAction {
  ZkKeyAction({
    this.onPressedCallback,
    this.onValueChangedCallback,
    this.buildPrefixIcon,
    this.buildWidgetList,
  });
  Function? onPressedCallback;
  Function? onValueChangedCallback;
  IconBuilder? buildPrefixIcon;
  WidgetListBuilder? buildWidgetList;

  void insertOnPressLogin(Function(String user, String password) fn) {
    onPressedCallback = fn;
  }

  void insertOnValueChangedInt(Function(int i) fn) {
    onValueChangedCallback = fn;
  }

  void onPressed(Map<String, dynamic>? params) =>
      onPressedCallback?.call(params);

  // void onValueChanged() => onValueChangedCallback?.call(null);

  Icon? get prefixIcon => (buildPrefixIcon == null) ? null : buildPrefixIcon!();

  // buildNavigationPage
  List<Widget>? get widgetList =>
      (buildWidgetList == null) ? null : buildWidgetList!();
}
