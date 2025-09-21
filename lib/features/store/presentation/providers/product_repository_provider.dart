import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ECommprarse/features/store/infrastructure/datasources/products_datasource_impl.dart';
import 'package:ECommprarse/features/store/infrastructure/repositories/products_repository_impl.dart';

part 'product_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ProductsRepositoryImpl productRepository(Ref ref) {
  final datasources = ProductsDatasourceImpl();
  return ProductsRepositoryImpl(datasources: datasources);
}
