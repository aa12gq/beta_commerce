import 'package:beta_commerce/common/routers/name.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../common/services/config.dart';

class SplashController extends GetxController {
  SplashController();

  _jumpToPage() {
    // 欢迎页
    Future.delayed(const Duration(seconds: 1), () {
      print('跳转到欢迎页');
      Get.offAllNamed(RouteNames.systemWelcome);
    });
  }

  initData() {
    update(["splash"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    // 删除设备启动图
    FlutterNativeSplash.remove();

    // 样式配置
    if (ConfigService.to.isAlreadyOpen) {
      Get.offAllNamed(RouteNames.systemWelcome);
    } else {
      Get.offAllNamed(RouteNames.main);
    }
  }


// @override
  // void onClose() {
  //   super.onClose();
  // }
}
