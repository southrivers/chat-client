import 'package:get/get.dart';

class LoginController extends GetxController {
  final _isLogin = false.obs;
  final _userName = ''.obs;
  final _passwd = ''.obs;

  bool get isLogin => _isLogin.value;
  set isLogin(bool value) => _isLogin.value = value;

  String get userName => _userName.value;

  String get passwd => _passwd.value;

  set userName(String value) => _userName.value = value;

  set passwd(String value) => _passwd.value = value;

  /**
   * 验证用户名密码
   */
  validLogin() async {
    // 调用后台接口验证用户登录
    return;
  }
}
