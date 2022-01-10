import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'zk_getx_filter.dart';
import 'zk_getx_storager.dart';
import 'zk_getx_translations.dart';
import 'package:zkfly/app/zk_app.dart';

class ZkGetxApp extends GetxController with ZkApp {
  static ZkGetxApp get to => Get.find();
  //can be override
  Future<void> init() async {
    Get.put<ZkGetxApp>(this, permanent: true);
    await putStorage();
  }

  // String get test => "in ZkGetxApp";

  Translations get translations => ZkGetxTranslations(null);

  //can be override
  Future<void> putStorage() async {
    await Get.putAsync(() => ZkGetxStorage().init(), permanent: true);
  }

  void run(Widget home) async {
    WidgetsFlutterBinding.ensureInitialized();
    await init();
    runApp(_GetxApp(home: home));
  }
}

class _GetxApp extends StatelessWidget {
  const _GetxApp({
    Key? key,
    required this.home,
  }) : super(key: key);
  final Widget home;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: _RootHome(home),
      translations: Get.find<ZkGetxApp>().translations,
    );
  }
}

class _RootHome extends StatelessWidget {
  const _RootHome(this.home);
  final Widget home;
  @override
  Widget build(BuildContext context) {
    // ZkShared.initMedia(context);
    return home;
  }
}
