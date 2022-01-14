import 'package:flutter/material.dart';
import 'zk_app_filter.dart';

class ZkValueKey extends ValueKey<String> {
  static const keyAreaServer = ZkValueKey("area_server");
  static const keyAreaServerTest = ZkValueKey("area_server_test");
  static const keyAreaServerSave = ZkValueKey("area_server_save");
  static const keyHomeRoute = ZkValueKey("home_route");
  static const keyHomeAppbar = ZkValueKey("home_appbar");
  static const keyLogin = ZkValueKey("login");
  static const keyMainPage = ZkValueKey("main_page");
  static const keyMainServer = ZkValueKey("main_server");
  static const keyMainServerTest = ZkValueKey("main_server_test");
  static const keyMainServerSave = ZkValueKey("main_server_save");
  static const keyPassword = ZkValueKey("password");
  static const keySave = ZkValueKey("save");
  static const keySettings = ZkValueKey("settings");
  static const keySettingsTap = ZkValueKey("settings_tap");
  static const keySettingsTapPage = ZkValueKey("settings_tap_page");
  static const keyTest = ZkValueKey("test");
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
typedef WidgetListBuilder = List<Widget>? Function();

class ZkKeyAction {
  ZkKeyAction(
      {this.onPressedCallback, this.buildPrefixIcon, this.buildWidgetList});
  VoidCallback? onPressedCallback;
  IconBuilder? buildPrefixIcon;
  WidgetListBuilder? buildWidgetList;
  void onPressed() {
    if (onPressedCallback != null) {
      onPressedCallback!();
    }
  }

  Icon? get prefixIcon => (buildPrefixIcon == null) ? null : buildPrefixIcon!();

  // buildNavigationPage
  List<Widget>? get widgetList =>
      (buildWidgetList == null) ? null : buildWidgetList!();
}
