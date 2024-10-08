import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';
import 'index.dart';

class IconPage extends GetView<IconController> {
  const IconPage({super.key});

  // 主视图
  Widget _buildView() {
    return ListView(
      children: [
        ListTile(
          leading: IconWidget.icon(Icons.home),
          title: const TextWidget.body1("IconWidget.icon"),
        ),
        ListTile(
          leading: IconWidget.image(AssetsImages.defaultPng),
          title: const TextWidget.body1("IconWidget.image"),
        ),
        ListTile(
          leading: IconWidget.svg(AssetsSvgs.cHomeSvg),
          title: const TextWidget.body1("IconWidget.svg"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IconController>(
      init: IconController(),
      id: "icon",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("icon")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
