import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:zkfly/getxapp/zk_getx_view.dart';
// import 'package:zkfly/getxapp/zk_getx_filter.dart';
import 'package:zkfly/getxapp/index.dart';

// abstract class ZkGetx

abstract class ZkGetxPageView<F extends ZkGetxFilter> extends ZkGetfindView<F> {
  final int itemCount;
  final int initPage;
  ZkGetxPageView({
    Key? key,
    this.initPage = 0,
    this.itemCount = 4,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: buildPage,
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageControllerOf(zkValueKey, initPage: initPage),
      onPageChanged: _onPageChanged,
    );
  }

  // @protected
  void _onPageChanged(int index) {
    // print("on page changed $index");
    controller.pageControllerOf(zkValueKey)?.currentPage.value = index;
    controller.onPageChanged(zkValueKey, index);
  }

  @protected
  Widget buildPage(BuildContext context, int page);
}

abstract class ZkGetxPageNavigationBar<F extends ZkGetxFilter>
    extends ZkGetfindView<F> {
  ZkGetxPageNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var page = controller.pageControllerOf(zkValueKey)?.currentPage.value ?? 0;
    // print("build bottom navigation bar $page");
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

class ZkGetxPageController extends PageController {
  ZkGetxPageController({
    int initialPage = 0,
    bool keepPage = true,
    double viewportFraction = 1.0,
  })  : currentPage = initialPage.obs,
        super(
          initialPage: initialPage,
          keepPage: keepPage,
          viewportFraction: viewportFraction,
        );
  RxInt currentPage = 0.obs;
}
