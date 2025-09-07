
import 'package:ecommerce_platzi/features/store/domain/entities/product.dart';
import 'package:ecommerce_platzi/features/store/presentation/providers/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Product>> getAllProducts(Ref ref) async{
  final repository = ref.watch( productRepositoryProvider );
  return await repository.getAllProducts();
}

@Riverpod(keepAlive: true)
Future<List<Product>> loadProductByCategory(Ref ref, String slug) async{
  final repository = ref.watch( productRepositoryProvider );
  return await repository.getProductsByCategory(slug);
}

@Riverpod(keepAlive: true)
Future<Product> getProductById(Ref ref, int id) {
  final repository = ref.watch( productRepositoryProvider );
  return repository.getProductById(id);
}


@Riverpod(keepAlive: true)
class Cart extends _$Cart {

  @override
  List<Product> build() {
    return [];
  }

  void addToCart( Product newProduct ){
    state = [ ...state, newProduct ];
  }

  void removeToCart( int productId ) {
    state = state.where((item) => item.id != productId ).toList();
  }

  void increaseItem( int productId ) {
    state = state.map<Product>( ( item ) => item.id == productId
        ? item.copyWith( quantity: item.quantity + 1 )
        : item
    ).toList();
  }

  void decreaseItem( int productId ) {
    state = state.map<Product>( ( item ) => item.id == productId && item.quantity > 1
        ? item.copyWith( quantity: item.quantity - 1 )
        : item
    ).toList();
  }

  void clearItems(){
    state = [];
  }

}












