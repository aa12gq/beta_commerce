import 'package:beta_commerce/common/index.dart';
import 'package:beta_commerce/pages/system/main/controller.dart' as ctl;
import 'package:beta_commerce/pages/system/main/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

class _MainViewGetX extends GetView<ctl.MainController> {
  const _MainViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(BuildContext context) {
    DateTime? lastPressedAt;
    return PopScope(
      canPop: true, // 设置为 false 禁用返回操作
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (lastPressedAt == null ||
            DateTime.now().difference(lastPressedAt!) > const Duration(seconds: 1)) {
          lastPressedAt = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(LocaleKeys.exitMessage.tr)),
          );
          return;
        }
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        // 导航栏
        bottomNavigationBar: GetBuilder<ctl.MainController>(
          id: 'navigation',
          builder: (controller) {
            return BuildNavigation(
              currentIndex: controller.currentIndex,
              items: [
                NavigationItemModel(
                  label: LocaleKeys.tabBarHome.tr,
                  icon: AssetsSvgs.navHomeSvg,
                ),
                NavigationItemModel(
                  label: LocaleKeys.tabBarCart.tr,
                  icon: AssetsSvgs.navCartSvg,
                  count: 3,
                ),
                NavigationItemModel(
                  label: LocaleKeys.tabBarMessage.tr,
                  icon: AssetsSvgs.navMessageSvg,
                  count: 9,
                ),
                NavigationItemModel(
                  label: LocaleKeys.tabBarProfile.tr,
                  icon: AssetsSvgs.navProfileSvg,
                ),
              ],
              onTap: controller.onJumpToPage, // 切换tab事件
            );
          },
        ),
        // 内容页
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onIndexChanged,
          children: const [
            Text("1"),
            Text("2"),
            Text("3"),
            Text("4"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ctl.MainController>(
      init: ctl.MainController(),
      id: "main",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("main")),
          body: SafeArea(
            child: _buildView(context),
          ),
        );
      },
    );
  }
}