




import 'package:ecommerce_platzi/features/store/domain/entities/product.dart';

abstract class LocalStorageDatasource {

  Future<void> toggleFavorite( Product product );

  Future<bool> isToggleFavorite( int productId );

  Future<List<Product>> showProducts();

}