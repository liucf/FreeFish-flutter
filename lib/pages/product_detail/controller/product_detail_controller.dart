import 'package:freefish/common/api/product_api.dart';
import 'package:freefish/common/models/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'product_detail_controller.g.dart';

@riverpod
Future<ProductModel> productDetailController(ProductDetailControllerRef ref,
    {required int id}) async {
  return await ProductApi.getProductDetail(id);
}
