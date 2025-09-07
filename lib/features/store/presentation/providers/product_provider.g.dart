// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllProductsHash() => r'8e39866e8dbfb9bf34051d9aeefe8a6a9a8afdb9';

/// See also [getAllProducts].
@ProviderFor(getAllProducts)
final getAllProductsProvider = FutureProvider<List<Product>>.internal(
  getAllProducts,
  name: r'getAllProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllProductsRef = FutureProviderRef<List<Product>>;
String _$loadProductByCategoryHash() =>
    r'137342155fc38ef8e992413fb59c7c5230de1f17';

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

/// See also [loadProductByCategory].
@ProviderFor(loadProductByCategory)
const loadProductByCategoryProvider = LoadProductByCategoryFamily();

/// See also [loadProductByCategory].
class LoadProductByCategoryFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [loadProductByCategory].
  const LoadProductByCategoryFamily();

  /// See also [loadProductByCategory].
  LoadProductByCategoryProvider call(String slug) {
    return LoadProductByCategoryProvider(slug);
  }

  @override
  LoadProductByCategoryProvider getProviderOverride(
    covariant LoadProductByCategoryProvider provider,
  ) {
    return call(provider.slug);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadProductByCategoryProvider';
}

/// See also [loadProductByCategory].
class LoadProductByCategoryProvider extends FutureProvider<List<Product>> {
  /// See also [loadProductByCategory].
  LoadProductByCategoryProvider(String slug)
    : this._internal(
        (ref) => loadProductByCategory(ref as LoadProductByCategoryRef, slug),
        from: loadProductByCategoryProvider,
        name: r'loadProductByCategoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$loadProductByCategoryHash,
        dependencies: LoadProductByCategoryFamily._dependencies,
        allTransitiveDependencies:
            LoadProductByCategoryFamily._allTransitiveDependencies,
        slug: slug,
      );

  LoadProductByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.slug,
  }) : super.internal();

  final String slug;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(LoadProductByCategoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadProductByCategoryProvider._internal(
        (ref) => create(ref as LoadProductByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        slug: slug,
      ),
    );
  }

  @override
  FutureProviderElement<List<Product>> createElement() {
    return _LoadProductByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadProductByCategoryProvider && other.slug == slug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoadProductByCategoryRef on FutureProviderRef<List<Product>> {
  /// The parameter `slug` of this provider.
  String get slug;
}

class _LoadProductByCategoryProviderElement
    extends FutureProviderElement<List<Product>>
    with LoadProductByCategoryRef {
  _LoadProductByCategoryProviderElement(super.provider);

  @override
  String get slug => (origin as LoadProductByCategoryProvider).slug;
}

String _$getProductByIdHash() => r'533817422c8c3c33da6932a195f8f4d258cfbdc4';

/// See also [getProductById].
@ProviderFor(getProductById)
const getProductByIdProvider = GetProductByIdFamily();

/// See also [getProductById].
class GetProductByIdFamily extends Family<AsyncValue<Product>> {
  /// See also [getProductById].
  const GetProductByIdFamily();

  /// See also [getProductById].
  GetProductByIdProvider call(int id) {
    return GetProductByIdProvider(id);
  }

  @override
  GetProductByIdProvider getProviderOverride(
    covariant GetProductByIdProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getProductByIdProvider';
}

/// See also [getProductById].
class GetProductByIdProvider extends FutureProvider<Product> {
  /// See also [getProductById].
  GetProductByIdProvider(int id)
    : this._internal(
        (ref) => getProductById(ref as GetProductByIdRef, id),
        from: getProductByIdProvider,
        name: r'getProductByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$getProductByIdHash,
        dependencies: GetProductByIdFamily._dependencies,
        allTransitiveDependencies:
            GetProductByIdFamily._allTransitiveDependencies,
        id: id,
      );

  GetProductByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Product> Function(GetProductByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductByIdProvider._internal(
        (ref) => create(ref as GetProductByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<Product> createElement() {
    return _GetProductByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetProductByIdRef on FutureProviderRef<Product> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetProductByIdProviderElement extends FutureProviderElement<Product>
    with GetProductByIdRef {
  _GetProductByIdProviderElement(super.provider);

  @override
  int get id => (origin as GetProductByIdProvider).id;
}

String _$cartHash() => r'c38c4df722dfc1a7480554d882e7e8ce6c433d80';

/// See also [Cart].
@ProviderFor(Cart)
final cartProvider = NotifierProvider<Cart, List<Product>>.internal(
  Cart.new,
  name: r'cartProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Cart = Notifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
