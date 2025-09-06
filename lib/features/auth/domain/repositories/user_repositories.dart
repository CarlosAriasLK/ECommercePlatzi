
abstract class UserRepositories {

  Future<String?> login( String email, String password );

  Future<void> logout();

  Future<String?> getToken();

}