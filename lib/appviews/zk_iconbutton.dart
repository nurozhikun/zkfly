import 'package:flutter/material.dart';
import 'package:zkfly/app/index.dart';

class ZkIconButton extends StatelessWidget with ZkValueKeyMixin {
  const ZkIconButton({
    Key? key,
    required this.iconBtn,
    this.filter,
  }) : super(key: key){
    iconBtn.onPressed = ()=> filter?.onPressed(zkValueKey);
  }
  final ZkFilter? filter;
  final IconButton iconBtn;
  @override
  Widget build(BuildContext context) {
    return iconBtn;
  }
}
