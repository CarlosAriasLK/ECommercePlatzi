


import 'package:ecommerce_platzi/features/auth/presentation/providers/auth_privider.dart';
import 'package:ecommerce_platzi/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_platzi/features/store/presentation/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref){

  final authStatus = ref.watch( authNotifierProvider );

  return GoRouter(
      initialLocation: '/login',

      redirect: (context, state) {
        final isGoingToLogin = state.matchedLocation == '/login';

        if( authStatus == AuthStatus.checking ) return null;

        if( authStatus == AuthStatus.unauthenticated && !isGoingToLogin ) return '/login';

        if( authStatus == AuthStatus.authenticated && isGoingToLogin ) return '/home/0';

        return null;
      },

      routes: [

        GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen(),
        ),

        GoRoute(
          path: '/home/:page',
          builder: (context, state) {
            final index = int.parse( state.pathParameters['page'] ?? '0');
            return HomeScreen(index: index);
          },
        ),

        GoRoute(
          path: '/products-details/:id',
          builder: (context, state) {
            final productId = int.parse( state.pathParameters['id'] ?? '1' );
            return ProductDetails(productId: productId,);
          },
        ),

      ]

  );

}
