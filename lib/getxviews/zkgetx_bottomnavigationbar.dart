import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zkfly/getxapp/index.dart';

abstract class ZkGetxBottomNavigationBar<F extends ZkGetxFilter>
    extends ZkGetfindView<F> {
  ZkGetxBottomNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex:
              controller.pageControllerOf(zkValueKey)?.currentPage.value ?? 0,
          items: bottomBars(context,
              controller.pageControllerOf(zkValueKey)?.currentPage.value ?? 0),
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
        ));
  }

  // @protected
  void _onTap(int index) {
    controller.pageControllerOf(zkValueKey)?.jumpToPage(index);
  }

  @protected
  List<BottomNavigationBarItem> bottomBars(BuildContext context, int index);
}
