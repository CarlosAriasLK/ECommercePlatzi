// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localStorageRepositoryHash() =>
    r'7fb36f812374a7735a489c543092fcd54c8f166f';

/// See also [localStorageRepository].
@ProviderFor(localStorageRepository)
final localStorageRepositoryProvider =
    AutoDisposeProvider<LocalStorageRepositoryImpl>.internal(
      localStorageRepository,
      name: r'localStorageRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$localStorageRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocalStorageRepositoryRef =
    AutoDisposeProviderRef<LocalStorageRepositoryImpl>;
String _$favoriteProductsHash() => r'ab78030c63a6c93d97aa8966dc67cf37b52c38e3';

/// See also [FavoriteProducts].
@ProviderFor(FavoriteProducts)
final favoriteProductsProvider =
    AutoDisposeAsyncNotifierProvider<FavoriteProducts, List<Product>>.internal(
      FavoriteProducts.new,
      name: r'favoriteProductsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$favoriteProductsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FavoriteProducts = AutoDisposeAsyncNotifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
