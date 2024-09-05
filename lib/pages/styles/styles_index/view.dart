import 'package:beta_commerce/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({super.key});

  // 主视图
  Widget _buildView() {
    return Column(children: [
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesText),
        title: const Text("Text 文本"),
      ),
      // Icon 图标
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesIcon),
        title: const TextWidget.body1("Icon 图标"),
      ),
      // Image 图片
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesImage),
        title: const TextWidget.body1("Image 图片"),
      ),


      // 多语言
      ListTile(
        onTap: controller.onLanguageSelected,
        title: Text(
          "语言 : ${ConfigService.to.locale.toLanguageTag()}",
        ),
      ),
      // 主题
      ListTile(
        onTap: controller.onThemeSelected,
        title: Text("主题 : ${ConfigService.to.isDarkModel ? "Dark" : "Light"}"),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesIndexController>(
      init: StylesIndexController(),
      id: "styles_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.stylesTitle.tr),
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
