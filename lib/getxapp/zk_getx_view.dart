import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'zk_getx_filter.dart';
import 'package:zkfly/app/zk_key.dart';

abstract class ZkGetputView<F extends ZkGetxFilter> extends StatelessWidget
    with MixZkValueKey {
  final F controller;
  ZkGetputView({
    Key? key,
    required F filter,
  })  : controller = Get.put<F>(filter),
        super(key: key);
  void onPressed() {
    controller.onPressed(zkValueKey);
  }
}

abstract class ZkGetfindView<F extends ZkGetxFilter> extends StatelessWidget
    with MixZkValueKey {
  final F controller = Get.find();
  ZkGetfindView({
    Key? key,
  }) : super(key: key);

  @protected
  void onPressed() {
    controller.onPressed(zkValueKey);
  }
}

mixin MixZkValueKey on Widget {
  ZkValueKey? get zkValueKey {
    if (key is ZkValueKey) {
      return key as ZkValueKey;
    }
    return null;
  }
}
