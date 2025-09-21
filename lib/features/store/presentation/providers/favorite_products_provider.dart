import 'package:ECommprarse/features/store/domain/entities/product.dart';
import 'package:ECommprarse/features/store/infrastructure/datasources/local_storage_datasource_impl.dart';
import 'package:ECommprarse/features/store/infrastructure/repositories/local_storage_repository_impl.dart';
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
    return await _loadFavoriteProducts();
  }

  Future<List<Product>> _loadFavoriteProducts() async{
    final repository = ref.watch( localStorageRepositoryProvider );
    return await repository.showProducts();
  }

  Future<bool> isToggleFavorite( int productId ) async{
    final repository = ref.watch( localStorageRepositoryProvider );
    return await repository.isToggleFavorite( productId );
  }

  Future<void> toggleFavorite(Product product) async {
    final repository = ref.read(localStorageRepositoryProvider);

    await repository.toggleFavorite(product);

    final updatedFavorites = await _loadFavoriteProducts();
    state = AsyncData(updatedFavorites);
  }

}
