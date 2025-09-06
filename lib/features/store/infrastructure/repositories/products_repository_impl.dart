

import 'package:ecommerce_platzi/features/store/domain/datasources/products_datasources.dart';
import 'package:ecommerce_platzi/features/store/domain/entities/product.dart';
import 'package:ecommerce_platzi/features/store/domain/repositories/products_repositories.dart';

class ProductsRepositoryImpl implements ProductsRepositories {

  final ProductsDatasources datasources;
  ProductsRepositoryImpl({required this.datasources});

  @override
  Future<List<Product>> getAllProducts() {
    return datasources.getAllProducts();
  }

  @override
  Future<Product> getProductById(int id) {
    return datasources.getProductById(id);
  }

  @override
  Future<List<Product>> getProductsByCategory(String slug) {
    return datasources.getProductsByCategory(slug);
  }

}