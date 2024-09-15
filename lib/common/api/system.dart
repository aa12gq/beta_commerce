import '../index.dart';

/// 系统 api
class SystemApi {
  /// Banner Ads
  static Future<List<KeyValueModel>> banners() async {
    List<KeyValueModel> bannerItems = [
      KeyValueModel(
          key: "01",
          value:
          "https://a12-c.oss-cn-beijing.aliyuncs.com/images/banner01.png"),
      KeyValueModel(
          key: "02",
          value:
          "https://a12-c.oss-cn-beijing.aliyuncs.com/images/banner02.png"),
      KeyValueModel(
          key: "03",
          value:
          "https://a12-c.oss-cn-beijing.aliyuncs.com/images/banner03.png"),
    ];

    return bannerItems;
  }
}
