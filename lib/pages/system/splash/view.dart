import 'package:beta_commerce/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/image.dart';
import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  Widget _buildView() {
    return const ImageWidget.asset(
      AssetsImages.splashJpg,
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
