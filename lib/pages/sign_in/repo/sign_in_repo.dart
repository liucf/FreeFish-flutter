import 'package:freefish/common/services/http_util.dart';

class SignInRepo {
  static getToken(String email, String password) async {
    return await HttpUtil().post("/sanctum/token",
        data: {"email": email, "password": password, "device_name": "mobile"});
  }

  static getUserProfile() async {
    return await HttpUtil().get("/api/user");
  }
}
