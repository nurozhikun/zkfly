import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'zk_getx_filter.dart';
import 'package:zkfly/app/zk_key.dart';

abstract class ZkGetxView<F extends ZkGetxFilter> extends StatelessWidget {
  final F controller;
  const ZkGetxView({Key? key, required this.controller}) : super(key: key);
  @protected
  void onPressed() {
    controller.funcOfPress(zkValueKey)?.call();
  }

  ZkValueKey? get zkValueKey {
    try {
      return key as ZkValueKey;
    } catch (_) {
      return null;
    }
  }
}

abstract class ZkGetputView<F extends ZkGetxFilter> extends ZkGetxView<F> {
  ZkGetputView({
    Key? key,
    required F filter,
  }) : super(key: key, controller: Get.put<F>(filter));
}

abstract class ZkGetfindView<F extends ZkGetxFilter> extends ZkGetxView<F> {
  ZkGetfindView({
    Key? key,
  }) : super(key: key, controller: Get.find<F>());
}

// abstract class ZkGetputView<F extends ZkGetxFilter> extends StatelessWidget
//     with ZkValueKeyMixin {
//   final F controller;
//   ZkGetputView({
//     Key? key,
//     required F filter,
//   })  : controller = Get.put<F>(filter),
//         super(key: key);
//   @protected
//   void onPressed() {
//     controller.funcOfPress(zkValueKey)?.call();
//   }
// }

// abstract class ZkGetfindView<F extends ZkGetxFilter> extends StatelessWidget
//     with ZkValueKeyMixin {
//   final F controller = Get.find();
//   ZkGetfindView({
//     Key? key,
//   }) : super(key: key);

//   @protected
//   void onPressed() {
//     controller.funcOfPress(zkValueKey)?.call();
//   }
// }
