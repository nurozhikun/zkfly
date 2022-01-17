import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:zkfly/styles/index.dart';
import 'package:zkfly/zkfly.dart';
// import 'zk_getx_filter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ZkGetxApp extends GetxController with ZkApp {
  static ZkGetxApp get to => Get.find();
  ZkGetxApp() {
    Get.put<ZkGetxApp>(this, permanent: true);
  }

  void run(Widget home) async {
    WidgetsFlutterBinding.ensureInitialized();
    await init();
    runApp(_GetxApp(home: home));
  }

  //can be override
  // @protected
  // ThemeData? get theme => null;
  @protected
  ZkGetxStorage? get storage => ZkGetxStorage();
  @protected
  ZkGetxPlatform? get platform => ZkGetxPlatform();
  @protected
  ZkGetxHttpApi? get httpapi => ZkGetxHttpApi();
  @protected
  Translations? get translations => ZkGetxTranslations(null);
  @protected
  Locale get local => const Locale('zh', 'CH');

  //获取本地存储：用户信息
  Future<void> init() async {
    await storage?.init();
    await platform?.init();
    // onInitTheme();
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

  /// 主题
  // 初始化
  // void onInitTheme() {
  //   String code = ZkGetxStorage.to.getString(ZkValueKey.keyTheme.value);
  //   if (code.isEmpty) {
  //     ZkGetxStorage.to.setString(ZkValueKey.keyTheme.value, 'indigo');
  //     theme = AppTheme.indigo;
  //   } else {
  //     theme = themeMap[code]!;
  //   }
  // }

  // 更新
  void onThemeUpdate(ThemeData value) {
    Get.changeTheme(value);
    ZkGetxStorage.to
        .setString(ZkValueKey.keyTheme.value, mapKey<String>(themeMap, value));
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
      translations: ZkGetxApp.to.translations,
      localizationsDelegates: const [
        // RefreshLocalizations.delegate, //刷新后英文变中文
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: ZkGetxStorage.to.local, //ZkGetxApp.to.local,
      // theme
      theme: ZkGetxStorage.to.theme,
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
