


import 'package:ECommprarse/features/store/domain/datasources/local_storage_datasource.dart';
import 'package:ECommprarse/features/store/domain/entities/product.dart';
import 'package:ECommprarse/features/store/domain/repositories/local_storage_repositorie.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepositorie {

  final LocalStorageDatasource datasource;
  LocalStorageRepositoryImpl({required this.datasource});

  @override
  Future<bool> isToggleFavorite(int productId) {
    return datasource.isToggleFavorite(productId);
  }

  @override
  Future<List<Product>> showProducts() {
    return datasource.showProducts();
  }

  @override
  Future<void> toggleFavorite(Product product) {
    return datasource.toggleFavorite(product);
  }
}