import '../models/request/user_register_req.dart';
import '../services/wp_http.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await WPHttpService.to.post(
      '/users/register',
      data: req,
    );

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }
}
