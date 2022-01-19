import 'package:get/get.dart';
import 'package:zkfly/app/index.dart';
// import 'package:dio/dio.dart';

class ZkGetxHttpApi extends GetxService with ZkHttpApi {
  static ZkGetxHttpApi get to => Get.find();
  // final Dio dio;
  ZkGetxHttpApi() {
    Get.put<ZkGetxHttpApi>(this, permanent: true);
  }
  Future<void> init() async {
    // BaseOptions();
  }
}
