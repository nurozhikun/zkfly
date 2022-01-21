import 'package:flutter/material.dart';
import 'index.dart';

class ZkMapView extends StatefulWidget {
  const ZkMapView({
    Key? key,
    this.paintCallback,
  }) : super(key: key);
  @override
  MapViewState createState() => MapViewState();
  final ViewPaintCallback? paintCallback;
}

class MapViewState extends State<ZkMapView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ZkGraphicsView(
          paintCallback: widget.paintCallback,
          child: Row(
            children: [
              Column(children: [
                IconButton(
                  icon: const Icon(Icons.add_box),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.indeterminate_check_box),
                  onPressed: () {},
                ),
              ]),
              const Expanded(
                child: Text(""),
              ),
            ],
          ),
        ),
        // Positioned(
        //   child: IconButton(
        //     icon: Icon(Icons.navigation),
        //     onPressed: () {},
        //   ),
        // ),
      ],
    );
  }
}
