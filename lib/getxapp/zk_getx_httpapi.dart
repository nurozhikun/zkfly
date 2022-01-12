import 'package:get/get.dart';
import 'package:zkfly/app/index.dart';

class ZkGetxHttpApi extends GetxService with ZkAppApi {
  static ZkGetxHttpApi get to => Get.find();
  ZkGetxHttpApi() {
    Get.put<ZkGetxHttpApi>(this, permanent: true);
  }
  Future<void> init() async {}
}
