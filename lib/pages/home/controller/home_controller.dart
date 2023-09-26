import 'package:freefish/common/api/product_api.dart';
import 'package:freefish/common/models/product_model.dart';
import 'package:freefish/common/models/user_profile_model.dart';
import 'package:freefish/global.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeBannerDots extends _$HomeBannerDots {
  @override
  int build() => 0;

  void changeIndex(int index) => state = index;
}

@Riverpod(keepAlive: true)
class HomeUserProfile extends _$HomeUserProfile {
  @override
  FutureOr<UserProfileModel> build() => Global.storageService.getUserProfile();
}

@Riverpod(keepAlive: true)
class HomePopularProducts extends _$HomePopularProducts {
  Future<List<ProductModel>> fetchPopularProducts() async =>
      await ProductApi.getPopularProducts();

  @override
  FutureOr<List<ProductModel>> build() => fetchPopularProducts();
}
