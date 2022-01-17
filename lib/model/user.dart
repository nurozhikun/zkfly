import 'package:zkfly/app/index.dart';
import 'package:zkfly/getxapp/index.dart';

class UserModel {
  static final UserModel singleton = UserModel._internal();

  factory UserModel() {
    return singleton;
  }

  UserModel._internal();

  String? username;

  // 传入用户名和token
  void saveUserInfo(String username) {
    this.username = username;
    saveInfo();
  }

  String getUserInfo() {
    return ZkGetxStorage.to.getString(ZkValueKey.keyUsername.value);
  }

  saveInfo() async {
    ZkGetxStorage.to.setString(ZkValueKey.keyUsername.value, username!);
  }

  void clearUserInfo() {
    username = null;
    ZkGetxStorage.to.remove(ZkValueKey.keyUsername.value);
  }

  bool isLogin() {
    return ZkGetxStorage.to.getString(ZkValueKey.keyUsername.value).isNotEmpty;
  }
}
