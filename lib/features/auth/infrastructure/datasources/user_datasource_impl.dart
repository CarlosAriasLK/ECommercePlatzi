


import 'package:ecommerce_platzi/features/auth/domain/datasources/user_datasources.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_platzi/features/shared/infrastructure/errors/custom_error.dart';
import 'package:ecommerce_platzi/features/shared/infrastructure/shared_preferences_impl.dart';

class UserDatasourceImpl implements UserDatasources {

  final dio = Dio( BaseOptions( baseUrl: 'https://api.escuelajs.co' ) );
  final tokenStorage = SharedPreferencesImpl();

  @override
  Future<String?> login(String email, String password) async{
    try {

      final response = await dio.post('/api/v1/auth/login', data: {
        'email': email,
        'password': password
      });

      if( response.statusCode == 201 ) {
        final token = response.data['access_token'] as String;
        await tokenStorage.saveToken( token );
        return token;
      }
      return null;

    } on DioException catch (e) {
      if( e.type == DioExceptionType.connectionTimeout ) {
        throw CustomError(error: 'Check internet connection');
      }
      if( e.response!.statusCode == 401 ){
        throw CustomError(error: 'Error in credentials');
      }
      throw Exception('Error: Unexpected error');
    }
  }

  @override
  Future<String?> getToken() async{
    return await tokenStorage.getToken();
  }

  @override
  Future<void> logout() async{
    return await tokenStorage.removeToken();
  }

}