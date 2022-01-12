import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'zk_getx_filter.dart';
import 'package:zkfly/app/zk_key.dart';

abstract class ZkGetputView<F extends ZkGetxFilter> extends StatelessWidget
    with ZkValueKeyMixin {
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
    with ZkValueKeyMixin {
  final F controller = Get.find();
  ZkGetfindView({
    Key? key,
  }) : super(key: key);

  @protected
  void onPressed() {
    controller.onPressed(zkValueKey);
  }
}
