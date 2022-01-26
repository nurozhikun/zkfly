import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zkfly/zkfly.dart';
// import 'zk_getx_filter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

abstract class _ZkGetxApp extends GetxController implements ZkApp {}

class ZkGetxApp extends _ZkGetxApp with ZkAppMixin {
// class ZkGetxApp extends GetxController implements ZkApp /* with ZkAppMixin  */ {
  static ZkGetxApp get to => Get.find();
  ZkGetxApp() {
    Get.put<ZkGetxApp>(this, permanent: true);
  }

  void run(Widget home) async {
    WidgetsFlutterBinding.ensureInitialized();
    await init();
    runApp(_GetxApp(home: home));
  }

  @override
  ZkShared get shared => ZkGetxStorage.to;
  @override
  ZkHttpApi? get httpApi => ZkGetxHttpApi.to;
  //can be override
  @protected
  ZkGetxStorage get createStorage => ZkGetxStorage();
  @protected
  ZkGetxHttpApi get createHttpApi => ZkGetxHttpApi();
  @protected
  Translations? get createTranslations => ZkGetxTranslations();
  @override
  set themeIndex(int i) {
    super.themeIndex = i;
    Get.changeTheme(theme);
  }

  @override
  set localeIndex(int i) {
    super.localeIndex = i;
    Get.updateLocale(locale);
  }

  //获取本地存储：用户信息
  Future<void> init() async {
    await createStorage.init();
    createHttpApi.init();
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
    return RefreshConfiguration(
      headerBuilder: () => const ClassicHeader(),
      footerBuilder: () => const ClassicFooter(),
      hideFooterWhenNotFull: true,
      maxOverScrollExtent: 100,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: _RootHome(home),
        translations: ZkGetxApp.to.createTranslations,
        localizationsDelegates: const [
          RefreshLocalizations.delegate, //刷新后英文变中文
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: ZkGetxApp.to.locale, //ZkGetxApp.to.local,
        // theme
        theme: ZkGetxApp.to.theme,
      ),
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
