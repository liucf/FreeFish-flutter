// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeBannerDotsHash() => r'15f781c3afe99330de75a73e699627962a83a11a';

/// See also [HomeBannerDots].
@ProviderFor(HomeBannerDots)
final homeBannerDotsProvider = NotifierProvider<HomeBannerDots, int>.internal(
  HomeBannerDots.new,
  name: r'homeBannerDotsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeBannerDotsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeBannerDots = Notifier<int>;
String _$homeUserProfileHash() => r'51b88615b722c6eca0cc06062d4646e065327f77';

/// See also [HomeUserProfile].
@ProviderFor(HomeUserProfile)
final homeUserProfileProvider =
    AsyncNotifierProvider<HomeUserProfile, UserProfileModel>.internal(
  HomeUserProfile.new,
  name: r'homeUserProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeUserProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeUserProfile = AsyncNotifier<UserProfileModel>;
String _$homePopularProductsHash() =>
    r'26a4cb62b958ced83570261e830784674000d375';

/// See also [HomePopularProducts].
@ProviderFor(HomePopularProducts)
final homePopularProductsProvider = AutoDisposeAsyncNotifierProvider<
    HomePopularProducts, List<ProductModel>>.internal(
  HomePopularProducts.new,
  name: r'homePopularProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homePopularProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomePopularProducts = AutoDisposeAsyncNotifier<List<ProductModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
