import 'package:ecommerce_platzi/config/router/app_router.dart';
import 'package:ecommerce_platzi/config/theme/app_theme.dart';
import 'package:ecommerce_platzi/features/auth/presentation/providers/auth_privider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(){
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final appRouter = ref.watch( appRouterProvider );

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme().getTheme()
    );
  }
}
