import 'package:get/get.dart';
import 'package:zkfly/app/index.dart';

import '../zkfly.dart';

class ZkGetxStorage extends GetxService with ZkShared {
  static ZkGetxStorage get to => Get.find();
  ZkGetxStorage() {
    Get.put<ZkGetxStorage>(this, permanent: true);
  }
  @override
  Future<ZkGetxStorage> init() async {
    await super.init();
    return this;
  }
}
