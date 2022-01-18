// import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'index.dart';

class ZkShared {
  late final SharedPreferences _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    ThemeData theme;
    // ThemeData.from(colorScheme: colorScheme)
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  dynamic getJson(String key) {
    var js = _prefs.getString(key);
    if (null == js) {
      return <String, dynamic>{};
    }
    try {
      return jsonDecode(js);
    } catch (_) {
      return <String, dynamic>{};
    }
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  int getInt(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  // 主题
  int get themeIndex => getInt(ZkValueKey.keyTheme.value);
  set themeIndex(int i) => setInt(ZkValueKey.keyTheme.value, i);
  // ThemeData? theme;
  // ThemeData? get themeGet => theme;
  // set themeSet(ThemeData themeData) => theme = themeData;
  Locale? get local => const Locale('zh', 'CH');
}
