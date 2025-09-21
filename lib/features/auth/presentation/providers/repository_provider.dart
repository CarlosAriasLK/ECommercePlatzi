

import 'package:ECommprarse/features/auth/infrastructure/datasources/user_datasource_impl.dart';
import 'package:ECommprarse/features/auth/infrastructure/repositories/user_repositories_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'repository_provider.g.dart';

@riverpod
UserRepositoriesImpl repository(Ref ref){

  final datasource = UserDatasourceImpl();
  return UserRepositoriesImpl(datasource: datasource);

}