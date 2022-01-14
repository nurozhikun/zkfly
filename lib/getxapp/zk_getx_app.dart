import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'zk_getx_filter.dart';
import 'zk_getx_storager.dart';
import 'zk_getx_translations.dart';
import 'package:zkfly/app/zk_app.dart';
import 'zk_getx_httpapi.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ZkGetxApp extends GetxController with ZkApp {
  static ZkGetxApp get to => Get.find();
  ZkGetxApp() {
    Get.put<ZkGetxApp>(this, permanent: true);
  }
  void run(Widget home) async {
    WidgetsFlutterBinding.ensureInitialized();
    await _init();
    runApp(_GetxApp(home: home));
  }

  //can be override
  @protected
  ZkGetxStorage? get storage => ZkGetxStorage();
  @protected
  ZkGetxHttpApi? get httpapi => ZkGetxHttpApi();
  @protected
  Translations? get translations => ZkGetxTranslations(null);
  @protected
  Locale get local => const Locale('zh', 'CH');

  Future<void> _init() async {
    await storage?.init();
    httpapi?.init();
  }

  // String get test => "in ZkGetxApp";

  //can be override
  Future<void> putStorage(ZkGetxStorage? storage) async {
    if (null == storage) {
      await Get.putAsync(() => ZkGetxStorage().init(), permanent: true);
    } else {
      Get.put<ZkGetxStorage>(storage, permanent: true);
    }
  }

  //can be override
  Future<void> putHttpApis(ZkGetxHttpApi? api, {String? tag}) async {
    if (api == null) {
      return;
    }
    Get.put<ZkGetxHttpApi>(api, tag: tag, permanent: true);
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
      debugShowCheckedModeBanner: false,
      home: _RootHome(home),
      translations: Get.find<ZkGetxApp>().translations,
      localizationsDelegates: const [
        // RefreshLocalizations.delegate, //刷新后英文变中文
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('zh', 'CN'),
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
