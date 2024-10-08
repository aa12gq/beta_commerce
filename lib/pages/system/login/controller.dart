import 'package:beta_commerce/common/index.dart';
import 'package:beta_commerce/common/models/request/user_login.dart';
import 'package:beta_commerce/common/routers/name.dart';
import 'package:beta_commerce/common/services/user.dart';
import 'package:beta_commerce/common/utils/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();

  /// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  /// 定义输入控制器
  TextEditingController userNameController =
  TextEditingController(text: "aa12gq");
  TextEditingController passwordController =
  TextEditingController(text: "12345678");

  /// Sign In
  Future<void> onSignIn() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();

        // api 请求
        UserTokenModel res = await UserApi.login(UserLoginReq(
          username: userNameController.text,
          password: EncryptUtil().aesEncode(passwordController.text),
        ));

        // 本地保存 token
        await UserService.to.setToken(res.token!);
        // 获取用户资料
        await UserService.to.getProfile();

        Loading.success();
        Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }

  /// Sign Up
  void onSignUp() {
    Get.offNamed(RouteNames.systemRegister);
  }

  _initData() {
    update(["login"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  /// 释放
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
