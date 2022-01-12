import 'package:get/get.dart';
import 'package:zkfly/app/index.dart';

class ZkGetxHttpApi extends GetxService with ZkAppApi {
  static ZkGetxHttpApi get to => Get.find();
  Future<void> init() async {
    Get.put<ZkGetxHttpApi>(this, permanent: true);
  }
}
