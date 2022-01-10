import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:zkfly/getxapp/zk_getx_view.dart';
// import 'package:zkfly/getxapp/zk_getx_filter.dart';
import 'package:zkfly/getxapp/index.dart';

abstract class ZkGetxPageView<F extends ZkGetxFilter> extends ZkGetfindView<F> {
  final int itemCount;
  ZkGetxPageView({
    Key? key,
    this.itemCount = 3,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: buildPage,
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageControllerOf(zkValueKey),
      onPageChanged: _onPageChanged,
    );
  }

  // @protected
  void _onPageChanged(int index) {
    controller.pageControllerOf(zkValueKey)?.currentPage = index.obs;
    controller.onPageChanged(zkValueKey, index);
  }

  @protected
  Widget buildPage(BuildContext context, int page);
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
