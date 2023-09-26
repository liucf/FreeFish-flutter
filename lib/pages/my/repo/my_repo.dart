import 'package:freefish/global.dart';

class MyRepo {
  static Future<void> logout() async {
    // await HttpUtil().post("/logout");
    Global.storageService.deleteUser();
  }
}
