import 'package:ecommerce_platzi/features/store/domain/entities/product.dart';
import 'package:ecommerce_platzi/features/store/infrastructure/datasources/local_storage_datasource_impl.dart';
import 'package:ecommerce_platzi/features/store/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_products_provider.g.dart';

@riverpod
LocalStorageRepositoryImpl localStorageRepository(Ref ref) {
  final datasource = LocalStorageDatasourceImpl();
  return LocalStorageRepositoryImpl(datasource: datasource);
}

@riverpod
class FavoriteProducts extends _$FavoriteProducts {

  @override
  Future<List<Product>> build() async{
    return await showProducts();
  }

  Future<bool> isToggleFavorite( int productId ) async{
    final repository = ref.watch( localStorageRepositoryProvider );
    return await repository.isToggleFavorite( productId );
  }

  Future<List<Product>> showProducts() async{
    final repository = ref.watch( localStorageRepositoryProvider );
    return await repository.showProducts();
  }

  Future<void> toggleFavorite( Product product ) async{
    final repository = ref.watch( localStorageRepositoryProvider );
    return await repository.toggleFavorite(product);
  }

}
