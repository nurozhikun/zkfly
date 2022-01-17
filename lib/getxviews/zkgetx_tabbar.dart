import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zkfly/getxapp/index.dart';

abstract class ZkGetxPageTabBar<F extends ZkGetxFilter>
    extends ZkGetfindView<F> {
  final int length;
  final int initialIndex;
  ZkGetxPageTabBar({Key? key, this.length = 3, this.initialIndex = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => TabBar(
          controller: controller.tabControllerOf(zkValueKey,
              vsync: controller, length: length, initialIndex: initialIndex),
          tabs: tabBars(
              context,
              controller
                      .tabControllerOf(zkValueKey,
                          vsync: controller,
                          length: length,
                          initialIndex: initialIndex)
                      ?.currentPage
                      .value ??
                  0),
          onTap: _onTap,
        ));
  }

  // @protected
  void _onTap(int index) {
    controller
        .tabControllerOf(zkValueKey,
            vsync: controller, length: length, initialIndex: initialIndex)
        ?.animateTo(index);
  }

  @protected
  List<Widget> tabBars(BuildContext context, int index);
}

class ZkGetxTabController extends TabController {
  ZkGetxTabController(
      {int initialIndex = 0, int length = 3, required TickerProvider vsync})
      : currentPage = initialIndex.obs,
        super(length: length, vsync: vsync);
  RxInt currentPage = 0.obs;
}
