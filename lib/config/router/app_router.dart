


import 'package:go_router/go_router.dart';
import 'package:ecommerce_platzi/presentation/screens/home_screen.dart';
import 'package:ecommerce_platzi/presentation/screens/product_details.dart';

final appRouter = GoRouter(
    initialLocation: '/home/0',

    routes: [
      GoRoute(
        path: '/home/:page',
        builder: (context, state) {
          final index = int.parse( state.pathParameters['page'] ?? '0');
          return HomeScreen(index: index);
        },
      ),

      GoRoute(
        path: '/products-details/:id',
        builder: (context, state) => ProductDetails(),
      )

    ]

);