import 'package:flutter/material.dart';
import 'package:zkfly/app/index.dart';

Widget buildIconButton(ZkValueKey key, ZkFilter filter, Widget icon,
    {EdgeInsetsGeometry padding = const EdgeInsets.all(8.0)}) {
  return IconButton(
    onPressed: () => filter.onPressed(key),
    icon: icon,
    padding: padding,
  );
}

class ZkIconButton extends StatelessWidget with ZkValueKeyMixin {
  const ZkIconButton({
    Key? key,
    this.filter,
    required this.icon,
    this.iconSize = 24.0,
    this.visualDensity,
    this.padding = const EdgeInsets.all(8.0),
    this.alignment = Alignment.center,
    this.splashRadius,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
    this.enableFeedback = true,
    this.constraints,
  }) : super(key: key);
  // filter?.onPressed(zkValueKey)
  final ZkFilter? filter;
  final Widget icon;
  final double iconSize;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final double? splashRadius;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? color;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? disabledColor;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? tooltip;
  final bool enableFeedback;
  final BoxConstraints? constraints;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => filter?.onPressed(zkValueKey),
        icon: icon,
        iconSize: iconSize,
        visualDensity: visualDensity,
        padding: padding,
        alignment: alignment,
        splashRadius: splashRadius,
        focusColor: focusColor,
        hoverColor: hoverColor,
        color: color,
        splashColor: splashColor,
        highlightColor: highlightColor,
        disabledColor: disabledColor,
        mouseCursor: mouseCursor,
        focusNode: focusNode,
        autofocus: autofocus,
        tooltip: tooltip,
        enableFeedback: enableFeedback,
        constraints: constraints);
  }
}
