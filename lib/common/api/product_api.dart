import 'package:freefish/common/models/product_model.dart';
import 'package:freefish/common/services/http_util.dart';

class ProductApi {
  static Future<List<ProductModel>> getPopularProducts() async {
    var res = await HttpUtil().get("/api/product/trending");
    List<ProductModel> popularProducts = [];
    for (var item in res.data) {
      popularProducts.add(ProductModel.fromJson(item));
    }
    return popularProducts;
  }

  static Future<ProductModel> getProductDetail(int id) async {
    var res = await HttpUtil().get("/api/product/byid/$id");
    return ProductModel.fromJson(res.data);
  }

  static Future<List<ProductModel>> getSearchResult(String query) async {
    var res = await HttpUtil().get("/api/product/search?query=$query");
    List<ProductModel> searchProducts = [];
    for (var item in res.data) {
      searchProducts.add(ProductModel.fromJson(item));
    }
    return searchProducts;
  }
}
