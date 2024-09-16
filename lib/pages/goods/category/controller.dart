import 'dart:convert';

import 'package:beta_commerce/common/api/product.dart';
import 'package:beta_commerce/common/models/beta/category_model/category_model.dart';
import 'package:beta_commerce/common/routers/name.dart';
import 'package:beta_commerce/common/utils/storage.dart';
import 'package:beta_commerce/common/values/constants.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  CategoryController();

  // 分类 id , 获取路由传递参数
  int? categoryId = Get.arguments['id'];

  // 分类导航数据
  List<CategoryModel> categoryItems = [];



  // 分类点击事件
  void onCategoryTap(int categoryId) {
    Get.toNamed(
      RouteNames.goodsCategory,
      arguments: {
        "id": categoryId,
      },
    );
  }

  // 初始数据
  _initData() async {
    // 读缓存
    var stringCategories =
    Storage().getString(Constants.storageProductsCategories);
    categoryItems = stringCategories != ""
        ? jsonDecode(stringCategories).map<CategoryModel>((item) {
      return CategoryModel.fromJson(item);
    }).toList()
        : [];

    // 如果本地缓存空
    if (categoryItems.isEmpty) {
      categoryItems = await ProductApi.categories(); // 获取分类数据
    }

    update(["left_nav"]);
  }


  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
