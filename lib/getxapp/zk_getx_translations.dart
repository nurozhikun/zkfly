// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZkGetxTranslations extends Translations {
  final _keys = <String, Map<String, String>>{};
  ZkGetxTranslations(Map<String, Map<String, String>>? ex) {
    append(ex);
  }
  @override
  Map<String, Map<String, String>> get keys => _keys;
  void append(Map<String, Map<String, String>>? ex) {
    ex?.forEach((String k, Map<String, String> v) {});
  }
}
