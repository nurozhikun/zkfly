import 'package:flutter/material.dart';
import 'index.dart';

abstract class ZkApp {
  ZkShared get shared;
  ZkHttpApi? get httpApi;
  Locale get local => const Locale('zh', 'CH');
  @protected //override by children
  ThemeData themeOf(int i);
}

mixin ZkAppMixin on ZkApp {
  ThemeData get theme => themeOf(shared.themeIndex);
  set themeIndex(int i) => shared.themeIndex = i;

  @override
  Locale get local => const Locale('zh', 'CH');
  @override
  ThemeData themeOf(int i) => ThemeData(
        primarySwatch: Colors.indigo,
      );
}
