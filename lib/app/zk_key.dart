import 'package:flutter/material.dart';

class ZkValueKey extends ValueKey<String> {
  static const keyMainRoute = ZkValueKey("zk_main_route");
  static const keyHomeAppbar = ZkValueKey("zk_home_appbar");
  const ZkValueKey(String s) : super(s);
}
