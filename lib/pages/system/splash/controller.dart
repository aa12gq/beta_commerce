import 'package:beta_commerce/common/routers/name.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../common/services/config.dart';

class SplashController extends GetxController {
  SplashController();

  _jumpToPage() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      if (ConfigService.to.isAlreadyOpen) {
        Get.offAllNamed(RouteNames.main);
      } else {
        Get.offAllNamed(RouteNames.systemWelcome);
      }
    });
  }

  // initData() {
  //   update(["splash"]);
  // }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

    @override
    void onReady() {
      super.onReady();
      FlutterNativeSplash.remove(); // 删除设备启动图
      // _initData(); // 初始数据
      _jumpToPage(); // 跳转界面
    }


// @override
  // void onClose() {
  //   super.onClose();
  // }
}
