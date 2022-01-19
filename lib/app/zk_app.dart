import 'package:flutter/material.dart';
import 'index.dart';

abstract class ZkApp {
  ZkShared get shared;
  ZkHttpApi? get httpApi;

  @protected //override by children
  ThemeData themeOf(int i);
  @protected //override by children
  Locale localeOf(int i);
}

mixin ZkAppMixin on ZkApp {
  // 主题
  ThemeData get theme => themeOf(shared.themeIndex);
  set themeIndex(int i) => shared.themeIndex = i;
  @override
  ThemeData themeOf(int i) => ThemeData(
        primarySwatch: Colors.indigo,
      );

  // 语言
  Locale get locale => localeOf(shared.localeIndex);
  set localeIndex(int i) => shared.localeIndex = i;
  @override
  Locale localeOf(int i) => const Locale('zh', 'CH');
}
