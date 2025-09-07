
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';

import 'package:ecommerce_platzi/features/auth/presentation/providers/auth_privider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    ref.listen<AuthStatus>( authNotifierProvider, (previous, next) {
        if (next == AuthStatus.unauthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error in credentials')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              content: Text('Welcome!!'),
            ),
          );
        }
      },
    );

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
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        label: Text('Email'),
                        border: OutlineInputBorder()
                      ),
                      validator: (value) {
                        if( value == null || value.isEmpty ) return 'Email required';
                        if( !value.contains('@') ) return 'Email not valid';
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text('Password'),
                          border: OutlineInputBorder()
                      ),
                      validator: (value) {
                        if( value == null || value.isEmpty ) return "Password required";
                        if( value.length < 6 ) return 'Password not valid';
                        return null;
                      },
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
                  onPressed: () {
                    if( _formKey.currentState!.validate() ) {
                      ref.read(authNotifierProvider.notifier).login(
                        emailController.text,
                        passwordController.text,
                      );
                    }
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
