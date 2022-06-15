import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:zkfly/getxapp/index.dart';

typedef FnOnPageChanged2 = void Function(int oldPage, int newPage);

class GetzkPageController extends PageController {
  GetzkPageController({
    int initialPage = 0,
    bool keepPage = true,
    double viewportFraction = 1.0,
    required this.onPageChanged,
  })  : currentPage = initialPage.obs,
        super(
          initialPage: initialPage,
          keepPage: keepPage,
          viewportFraction: viewportFraction,
        );
  RxInt currentPage = 0.obs;
  // void onPageChanged(int oldIndex, int newIndex) {}
  final FnOnPageChanged2 onPageChanged;
}

abstract class GetzkPageView extends StatelessWidget {
  //<F extends ZkGetxFilter> extends ZkGetfindView<F> {
  const GetzkPageView({
    Key? key,
    this.itemCount = 4,
    required this.pageCtrl,
  }) : super(key: key);
  final GetzkPageController pageCtrl;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: buildPage,
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      controller: pageCtrl,
      onPageChanged: _onPageChanged,
    );
  }

  void _onPageChanged(int index) {
    int oldIndex = pageCtrl.currentPage.value;
    pageCtrl.currentPage.value = index;
    pageCtrl.onPageChanged(oldIndex, index);
  }

  @protected
  Widget buildPage(BuildContext context, int page);
}

abstract class GetzkPageBottomNavigationBar extends StatelessWidget {
  const GetzkPageBottomNavigationBar({
    Key? key,
    required this.pageCtrl,
  }) : super(key: key);
  final GetzkPageController pageCtrl;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: pageCtrl.currentPage.value,
        items: barItems(context, pageCtrl.currentPage.value),
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        // iconSize: 18,
        // selectedFontSize: 12,
        // unselectedFontSize: 10,
      ),
    );
  }

  // @protected
  void _onTap(int index) {
    pageCtrl.jumpToPage(index);
  }

  @protected
  List<BottomNavigationBarItem> barItems(BuildContext context, int index);
}
