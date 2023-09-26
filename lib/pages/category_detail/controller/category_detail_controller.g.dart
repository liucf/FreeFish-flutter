// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryDetailControllerHash() =>
    r'a8df1effa5f1dcb5a54d2c495a7a4e1b55d84727';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [categoryDetailController].
@ProviderFor(categoryDetailController)
const categoryDetailControllerProvider = CategoryDetailControllerFamily();

/// See also [categoryDetailController].
class CategoryDetailControllerFamily
    extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [categoryDetailController].
  const CategoryDetailControllerFamily();

  /// See also [categoryDetailController].
  CategoryDetailControllerProvider call({
    required String subname,
  }) {
    return CategoryDetailControllerProvider(
      subname: subname,
    );
  }

  @override
  CategoryDetailControllerProvider getProviderOverride(
    covariant CategoryDetailControllerProvider provider,
  ) {
    return call(
      subname: provider.subname,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoryDetailControllerProvider';
}

/// See also [categoryDetailController].
class CategoryDetailControllerProvider
    extends AutoDisposeFutureProvider<List<ProductModel>> {
  /// See also [categoryDetailController].
  CategoryDetailControllerProvider({
    required String subname,
  }) : this._internal(
          (ref) => categoryDetailController(
            ref as CategoryDetailControllerRef,
            subname: subname,
          ),
          from: categoryDetailControllerProvider,
          name: r'categoryDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryDetailControllerHash,
          dependencies: CategoryDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              CategoryDetailControllerFamily._allTransitiveDependencies,
          subname: subname,
        );

  CategoryDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subname,
  }) : super.internal();

  final String subname;

  @override
  Override overrideWith(
    FutureOr<List<ProductModel>> Function(CategoryDetailControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryDetailControllerProvider._internal(
        (ref) => create(ref as CategoryDetailControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subname: subname,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductModel>> createElement() {
    return _CategoryDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryDetailControllerProvider &&
        other.subname == subname;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subname.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryDetailControllerRef
    on AutoDisposeFutureProviderRef<List<ProductModel>> {
  /// The parameter `subname` of this provider.
  String get subname;
}

class _CategoryDetailControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductModel>>
    with CategoryDetailControllerRef {
  _CategoryDetailControllerProviderElement(super.provider);

  @override
  String get subname => (origin as CategoryDetailControllerProvider).subname;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
