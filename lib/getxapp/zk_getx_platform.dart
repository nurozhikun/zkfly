import 'package:get/get.dart';
import 'package:zkfly/utils/index.dart';

class ZkGetxPlatform extends GetxService {
  static ZkGetxPlatform get to => Get.find();
  ZkGetxPlatform() {
    Get.put<ZkGetxPlatform>(this, permanent: true);
  }
  RxString identifier = ''.obs;
  @override
  Future<ZkGetxPlatform> init() async {
    // 获取设备号
    identifier.value = await initPlatformState();

    return this;
  }
}
