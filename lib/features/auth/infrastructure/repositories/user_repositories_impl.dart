

import 'package:ECommprarse/features/auth/domain/datasources/user_datasources.dart';
import 'package:ECommprarse/features/auth/domain/repositories/user_repositories.dart';

class UserRepositoriesImpl implements UserRepositories {

  final UserDatasources datasource;
  UserRepositoriesImpl({required this.datasource});

  @override
  Future<String?> getToken() {
    return datasource.getToken();
  }

  @override
  Future<String?> login(String email, String password) {
    return datasource.login(email, password);
  }

  @override
  Future<void> logout() {
    return datasource.logout();
  }


}