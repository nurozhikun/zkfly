import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:zkfly/getxapp/zk_getx_view.dart';
// import 'package:zkfly/getxapp/zk_getx_filter.dart';
import 'package:zkfly/getxapp/index.dart';

class ZkGetxLoginView<F extends ZkGetxFilter> extends ZkGetfindView<F> {
  ZkGetxLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        // children: _buildChildren(),
      ),
    );
  }


}
