import 'dart:convert';

import 'package:freefish/common/models/category_model.dart';
import 'package:freefish/common/models/product_model.dart';
import 'package:freefish/common/services/http_util.dart';

class CategoryApi {
  static Future<List<CategoryModel>> getCategorys() async {
    var res = await HttpUtil().get("/api/category");
    List<CategoryModel> category = [];
    for (var item in res.data) {
      category.add(CategoryModel.fromJson(item));
    }
    return category;
  }

  // static Future<CategoryModel> getProductDetail(int id) async {
  //   var res = await HttpUtil().get("/api/product/byid/$id");
  //   return ProductModel.fromJson(res.data);
  // }

  static Future<List<ProductModel>> getProductsBySubcategory(
      String name) async {
    var res = await HttpUtil().get("/api/subcategory/show/$name");

    List<ProductModel> categoryProducts = [];
    var jsonres = json.decode(res.toString());
    for (var item in jsonres['data']) {
      // print(item);
      categoryProducts.add(ProductModel.fromJson(item));
    }
    return categoryProducts;
  }
}
