import 'package:freefish/common/api/category_api.dart';
import 'package:freefish/common/models/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'category_detail_controller.g.dart';

@riverpod
Future<List<ProductModel>> categoryDetailController(
    CategoryDetailControllerRef ref,
    {required String subname}) async {
  return await CategoryApi.getProductsBySubcategory(subname);
}
