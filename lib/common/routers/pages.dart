import 'package:beta_commerce/pages/system/login/index.dart';
import 'package:beta_commerce/pages/system/splash/view.dart';
import "package:get/get.dart";

class RoutePages {
  static List<GetPage> list = [
    GetPage(
      name: "/",
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: "/splash",
      page: () => const SplashPage(),
    ),
  ];
}
