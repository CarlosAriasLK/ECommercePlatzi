


import 'package:ecommerce_platzi/features/store/domain/entities/product.dart';

abstract class ProductsDatasources {

  Future<List<Product>> getAllProducts();

  Future<List<Product>> getProductsByCategory( String slug );

  Future<Product> getProductById( int id );

}