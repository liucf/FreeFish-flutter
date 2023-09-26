import 'package:freefish/common/api/product_api.dart';
import 'package:freefish/common/models/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'search_controller.g.dart';

@riverpod
Future<List<ProductModel>> searchController(SearchControllerRef ref,
    {required String query}) async {
  return await ProductApi.getSearchResult(query);
}
