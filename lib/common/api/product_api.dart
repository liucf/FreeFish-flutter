import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freefish/common/models/product_model.dart';
import 'package:freefish/common/services/http_util.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

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

  static Future<bool> sell(
      {required String name,
      required String description,
      required String price,
      String rootcategory = "6",
      String subcategory = "82",
      required List<AssetEntity> photos}) async {
    File? file = await photos.first.file;

    var formData = FormData.fromMap({
      "image":
          await MultipartFile.fromFile(file!.path, filename: "flutter.jpg"),
    });
    formData.fields.add(MapEntry("name", name));
    formData.fields.add(MapEntry("description", description));
    formData.fields.add(MapEntry("price", price));
    formData.fields.add(MapEntry("rootcategory", rootcategory));
    formData.fields.add(MapEntry("subcategory", subcategory));
    formData.fields.add(const MapEntry("imageName", "flutter"));
    formData.fields.add(const MapEntry("imageExtension", "jpg"));

    // formData.files.add(MapEntry("image", await photos.first.file));

    // var entity = photos.first;
    // MultipartFile mf;
    // final file = await photos.first.file;
    // if (file == null) {
    //   throw StateError('Unable to obtain file of the entity');
    // }
    // mf = await MultipartFile.fromFile(file.path);

    // // Using the bytes.
    // final bytes = await entity.originBytes;
    // if (bytes == null) {
    //   throw StateError('Unable to obtain bytes of the entity ${entity.id}.');
    // }
    // mf = MultipartFile.fromBytes(bytes);

    // formData.files.add(MapEntry("image", mf));

    await HttpUtil().post("/api/sell", data: formData);
    return true;
  }
}
