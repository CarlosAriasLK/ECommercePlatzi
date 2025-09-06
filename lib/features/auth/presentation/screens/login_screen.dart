
import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_platzi/features/auth/presentation/providers/auth_privider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FadeInDown(
        duration: Duration(milliseconds: 500),
        from: 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),

            Center(child: Text('EcoMprarse', style: TextStyle( fontSize: 50, fontWeight: FontWeight.bold),)),

            SizedBox(height: 100,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text('Login', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 25,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        label: Text('Email'),
                        border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        label: Text('Password'),
                          border: OutlineInputBorder()
                      ),
                    )
                  ],
                )
              ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Align(
                alignment: Alignment.topRight,
                child: FilledButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(7)
                      )
                    )
                  ),
                  onPressed: (){
                    ref.read( authNotifierProvider.notifier ).login(emailController.text, passwordController.text);
                  },
                  child: Text('Log in')
                )
              ),
            )

          ],
        ),
      ),
    );
  }
}
