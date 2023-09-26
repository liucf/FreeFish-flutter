import 'package:freefish/common/models/user_profile_model.dart';
import 'package:freefish/common/models/user_token_model.dart';
import 'package:freefish/common/services/http_util.dart';

class SignInRepo {
  static Future<UserTokenModel> getToken(String email, String password) async {
    var res = await HttpUtil().post("/sanctum/token",
        data: {"email": email, "password": password, "device_name": "mobile"});
    return UserTokenModel.fromJson(res.data);
  }

  static Future<UserProfileModel> getUserProfile() async {
    var res = await HttpUtil().get("/api/user");
    return UserProfileModel.fromJson(res.data['data']);
  }
}
