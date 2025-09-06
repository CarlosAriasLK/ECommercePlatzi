

import 'package:ecommerce_platzi/features/auth/infrastructure/datasources/user_datasource_impl.dart';
import 'package:ecommerce_platzi/features/auth/infrastructure/repositories/user_repositories_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'repository_provider.g.dart';

@riverpod
UserRepositoriesImpl repository(Ref ref){

  final datasource = UserDatasourceImpl();
  return UserRepositoriesImpl(datasource: datasource);

}