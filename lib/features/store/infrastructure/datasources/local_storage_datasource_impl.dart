

import 'package:ecommerce_platzi/config/database/db.dart';
import 'package:ecommerce_platzi/features/store/domain/datasources/local_storage_datasource.dart';
import 'package:ecommerce_platzi/features/store/domain/entities/product.dart';

class LocalStorageDatasourceImpl implements LocalStorageDatasource {

  final db = Db();

  @override
  Future<bool> isToggleFavorite(int productId) async{
    final dbInstance = await db.database;

    final result = await dbInstance.query(
      'products',
      where: 'id = ?',
      whereArgs: [productId],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  @override
  Future<List<Product>> showProducts() async{
    final dbInstance = await db.database;
    final response = await dbInstance.query('products');

    return response.map( (item) => Product.fromMap( item ) ).toList();
  }

  @override
  Future<void> toggleFavorite(Product product) async {
    final dbInstance = await db.database;

    final response = await dbInstance.query(
      'products',
      where: 'id = ?',
      whereArgs: [product.id],
      limit: 1,
    );

    if (response.isEmpty) {
      await dbInstance.insert(
        'products',
        product.toMap(),
      );
    } else {
      await dbInstance.delete(
        'products',
        where: 'id = ?',
        whereArgs: [product.id],
      );
    }
  }

}