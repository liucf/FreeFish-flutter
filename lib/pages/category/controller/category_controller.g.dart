// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedCategoryHash() => r'9bcff8d851c61ca5eeb1ed2eba6c1c662dcdfc71';

/// See also [SelectedCategory].
@ProviderFor(SelectedCategory)
final selectedCategoryProvider =
    AutoDisposeNotifierProvider<SelectedCategory, int>.internal(
  SelectedCategory.new,
  name: r'selectedCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCategory = AutoDisposeNotifier<int>;
String _$categoryListHash() => r'5c85ed86215ad42665387db970109a5d6a4f76c5';

/// See also [CategoryList].
@ProviderFor(CategoryList)
final categoryListProvider =
    AsyncNotifierProvider<CategoryList, List<CategoryModel>>.internal(
  CategoryList.new,
  name: r'categoryListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoryListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryList = AsyncNotifier<List<CategoryModel>>;
String _$categoryProductsHash() => r'00d7152c55b7408e707e51d88bb4ed2469b8f113';

/// See also [CategoryProducts].
@ProviderFor(CategoryProducts)
final categoryProductsProvider = AutoDisposeAsyncNotifierProvider<
    CategoryProducts, List<ProductModel>>.internal(
  CategoryProducts.new,
  name: r'categoryProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryProducts = AutoDisposeAsyncNotifier<List<ProductModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
