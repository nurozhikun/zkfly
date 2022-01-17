// dialog缩放进入和退出
import 'package:flutter/material.dart';
import 'package:get/get.dart';

scaleDialogView(Widget widget,
    {bool isCancel = true, required String title}) async {
  var alertDialogs =
      await Get.generalDialog(pageBuilder: (context, anim1, anim2) {
    return ScaleDialogContent(
        bodyWidget: widget, title: title, isCancel: isCancel);
  }, transitionBuilder: (context, anim1, anim2, child) {
    return Transform.scale(
        scale: anim1.value, child: Opacity(opacity: anim1.value, child: child));
  });
  return alertDialogs;
}

class ScaleDialogContent extends StatelessWidget {
  const ScaleDialogContent({
    Key? key,
    required this.bodyWidget,
    required this.title,
    this.isCancel = false,
  }) : super(key: key);

  // body
  final Widget bodyWidget;

  // 标题
  final String title;

  // 是否需要删除按钮
  final bool? isCancel;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Center(
            child: Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // header
                    titleBar(title),
                    // body
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: bodyWidget,
                    ),
                    // footer
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 取消
                        isCancel ?? false
                            ? Expanded(
                                child: scaleDialogFooter(
                                    text: '取消',
                                    onTap: () => Get.back(result: 'cancel')))
                            : const Text(''),
                        // 确定
                        Expanded(child: scaleDialogConfirm(bodyWidget)),
                      ],
                    )
                  ],
                ))));
  }
}

// header
Widget titleBar(String title) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        color: Get.theme.primaryColor),
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
    child: Text(
      title,
      style: const TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}

// footer
Widget scaleDialogFooter({String? text, Color? color, VoidCallback? onTap}) {
  return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
        child: Text(text ?? '',
            style: TextStyle(color: Colors.cyan[700], fontSize: 14)),
      ));
}

Widget scaleDialogConfirm(Widget widget) {
  return scaleDialogFooter(
      text: '确定',
      onTap: () {
        // //  返回，判断widget
        // if (widget.runtimeType == CommandKey) {
        //   Get.find<CommandKeyController>().handleBack();

        //   // 树形_一层
        // } else if ((widget.runtimeType == TreeViewSelect<String>) ||
        //     (widget.runtimeType == TreeViewSelect<Area>)) {
        //   Get.back(
        //       result: Get.find<TreeViewSelectController>()
        //           .state
        //           .selectedNodes
        //           .toList());
        // } else {
        //   Get.back(result: 'sure');

        //   // 筛选(一级)
        // } else if (widget.runtimeType == FilerOneLevel) {
        //   Map<String, bool> mapArr =
        //       Map.from(Get.find<FilterOneLevelController>().mapList);
        //   mapArr.removeWhere((key, value) => value == false);
        //   Get.back(result: mapArr.keys.toList());

        //   // 树形选择
        // }
      });
}

// bodyWidget
class GeneralMessageDialog extends StatelessWidget {
  const GeneralMessageDialog({Key? key, required this.message})
      : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
        child: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
