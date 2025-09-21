

import 'package:ECommprarse/features/store/domain/entities/product.dart';

abstract class ProductsRepositories {

  Future<List<Product>> getAllProducts();

  Future<List<Product>> getProductsByCategory( String slug );

  Future<Product> getProductById( int id );

}