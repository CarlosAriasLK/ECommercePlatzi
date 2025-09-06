
import 'package:ecommerce_platzi/features/store/domain/entities/product.dart';
import 'package:ecommerce_platzi/features/store/presentation/providers/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@Riverpod(keepAlive: true)
class Products extends _$Products {

  @override
  Future<List<Product>> build() async {
    final products = ref.watch( productRepositoryProvider );
    return products.getAllProducts();
  }

  Future<List<Product>> loadProductByCategory( String slug ) async{
    try {
      return await ref.watch( productRepositoryProvider ).getProductsByCategory(slug);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

