import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController();

  GlobalKey formKey = GlobalKey<FormState>();

  // 用户名
  TextEditingController userNameController =
  TextEditingController(text: "aa12gq");
  // 邮件
  TextEditingController emailController =
  TextEditingController(text: "aa12gq5@gmail.com");
  // 姓
  TextEditingController firstNameController =
  TextEditingController(text: "aa12gq");
  // 名
  TextEditingController lastNameController = TextEditingController(text: "aa12");
  // 密码
  TextEditingController passwordController =
  TextEditingController(text: "12345678");

  _initData() {
    update(["register"]);
  }

  // 注册
  void onSignUp() {}

  // 登录
  void onSignIn() {}


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

  // 释放
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
  }
}
