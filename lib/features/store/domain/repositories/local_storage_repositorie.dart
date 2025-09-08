




import 'package:ecommerce_platzi/features/store/domain/entities/product.dart';

abstract class LocalStorageRepositorie {

  Future<void> toggleFavorite( Product product );

  Future<bool> isToggleFavorite( int productId );

  Future<List<Product>> showProducts();

}