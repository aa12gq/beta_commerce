import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common/index.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896), // 设计稿中设备的尺寸(单位随意,建议dp,但在使用过程中必须保持一致)
      splitScreenMode: false, // 支持分屏尺寸
      minTextAdapt: false, // 是否根据宽度/高度中的最小值适配文字
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',

          // 样式
          theme: ConfigService.to.isDarkModel ? AppTheme.dark : AppTheme.light,

          // 路由
          initialRoute: RouteNames.stylesStylesIndex,
          getPages: RoutePages.list,
          navigatorObservers: [RoutePages.observer],

          // builder
          builder: (context, widget) {
            // 使用 textScaler 进行文本缩放
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: widget!,
            );
          },

          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

}