import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'dart:async';
import 'package:/zkfly/utils/index.dart';

typedef ViewPaintCallback = void Function(
    Canvas canvas, Size size, BuildContext context);

class ZkGraphicsView extends StatefulWidget {
  const ZkGraphicsView({
    Key? key,
    this.child,
    this.backgroundImageUri,
    this.refresh = Duration.zero,
    this.paintCallback,
  }) : super(key: key);
  static ZkGraphicsViewState? of(BuildContext context) =>
      context.findAncestorStateOfType<ZkGraphicsViewState>();

  final Widget? child;
  final String? backgroundImageUri;
  final Duration refresh;
  final ViewPaintCallback? paintCallback;
  @override
  ZkGraphicsViewState createState() => ZkGraphicsViewState();
}

class ZkGraphicsViewState extends State<ZkGraphicsView> {
  final ZkGraphicsViewItem root = ZkGraphicsViewItem(code: "");
  ui.Image? _bgImg;
  Timer? refreshTimer;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(1920, 1280),
      painter: _ZkGraphicsViewPainter(this),
      child: widget.child,
    );
  }

  @override
  void initState() {
    _loadBackgroundImage();
    refreshTimer?.cancel();
    if (widget.refresh > Duration.zero) {
      refreshTimer = Timer.periodic(widget.refresh, (timer) {
        setState(() {});
      });
    }
    super.initState();
  }

  void _loadBackgroundImage() {
    if (null != widget.backgroundImageUri) {
      ZkFlyCore.getAssetImage(widget.backgroundImageUri!).then((value) {
        setState(() {
          _bgImg = value;
        });
      });
    }
  }
}

class _ZkGraphicsViewPainter extends CustomPainter {
  _ZkGraphicsViewPainter(this.state);
  final ZkGraphicsViewState state;
  @override
  void paint(Canvas canvas, Size size) {
    // print("drawing ... $size");
    state.widget.paintCallback?.call(canvas, size, state.context);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

enum ZkGraphicsViewItemType {
  none,
  point,
  line,
  rect,
  ellipse,
  polyline,
  polygon,
  image,
}

class ZkGraphicsViewItem {
  ZkGraphicsViewItem({
    required this.code,
    this.itemType = ZkGraphicsViewItemType.none,
  });
  final String code;
  final ZkGraphicsViewItemType itemType;
  List<ZkGraphicsViewItem> children = [];
}
