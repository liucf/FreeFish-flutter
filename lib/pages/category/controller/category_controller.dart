import 'package:freefish/common/api/category_api.dart';
import 'package:freefish/common/api/product_api.dart';
import 'package:freefish/common/models/category_model.dart';
import 'package:freefish/common/models/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'category_controller.g.dart';

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  int build() => 0;

  void changeIndex(int index) => state = index;
}

@Riverpod(keepAlive: true)
class CategoryList extends _$CategoryList {
  Future<List<CategoryModel>> fetchCategoryList() async =>
      await CategoryApi.getCategorys();

  @override
  FutureOr<List<CategoryModel>> build() => fetchCategoryList();
}

@riverpod
class CategoryProducts extends _$CategoryProducts {
  Future<List<ProductModel>> fetchPopularProducts() async =>
      await ProductApi.getPopularProducts();

  @override
  FutureOr<List<ProductModel>> build() => fetchPopularProducts();
}
