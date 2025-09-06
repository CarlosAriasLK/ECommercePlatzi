



import 'package:ecommerce_platzi/features/auth/presentation/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_privider.g.dart';

enum AuthStatus { checking, authenticated, unauthenticated }

@riverpod
class AuthNotifier extends _$AuthNotifier {

  @override
  AuthStatus build(){
    _init();
    return AuthStatus.checking;
  }

  void _init()async{
    await checkAuth();
  }

  Future<void> checkAuth() async{
    final token = await ref.read( repositoryProvider ).getToken();
    if( token != null ){
      state = AuthStatus.authenticated;
    } else {
      state = AuthStatus.unauthenticated;
    }
  }

  Future<void> login(String email, String password) async{
    final token = await ref.read( repositoryProvider ).login(email, password);
    if( token != null) {
      state = AuthStatus.authenticated;
    }
  }

  Future<void> logout() async{
    await ref.read( repositoryProvider ).logout();
    state = AuthStatus.unauthenticated;
  }

}