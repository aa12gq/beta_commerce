import 'package:beta_commerce/pages/system/login/index.dart';
import "package:get/get.dart";

class RoutePages {
  static List<GetPage> list = [
    GetPage(
      name: "/",
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
