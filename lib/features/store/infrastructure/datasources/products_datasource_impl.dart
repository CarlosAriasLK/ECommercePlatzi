


import 'package:dio/dio.dart';
import 'package:ECommprarse/features/store/domain/datasources/products_datasources.dart';
import 'package:ECommprarse/features/store/domain/entities/product.dart';

class ProductsDatasourceImpl implements ProductsDatasources {

  final dio = Dio( BaseOptions( baseUrl: 'https://api.escuelajs.co' ) );

  @override
  Future<List<Product>> getAllProducts() async{
    try {
      final response = await dio.get('/api/v1/products/');
      final List reponseList = response.data;
      return reponseList.map( (product) => Product.fromJson(product) ).toList();

    }catch (e){
      throw Exception('Error $e');
    }
  }

  @override
  Future<Product> getProductById(int id) async{
    try {
      final response = await dio.get('/api/v1/products/$id');
      return Product.fromJson(response.data);
    } catch (e) {
      throw Exception("Error $e");
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(String slug) async{
    try {
      final response = await dio.get('/api/v1/products/?categoryId=$slug');
      final List responseList = response.data;
      return responseList.map( (product) => Product.fromJson(product) ).toList();
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

}