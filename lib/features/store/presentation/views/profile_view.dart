
import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_platzi/features/auth/presentation/providers/auth_privider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle( fontWeight: FontWeight.bold),),
      ),

      body: FadeInRight(
        duration: Duration(milliseconds: 500),
        from: 30,
        child: Column(
          children: [

            Container(
              height: 300,
              color: Colors.blueGrey,
              child: Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(7),
                      child: FadeInImage(
                        height: 200,
                        placeholder: AssetImage('assets/images/profile-not-found.png'),
                        image: NetworkImage('https://i.imgur.com/LDOO4Qs.jpg')
                      ),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Name: Jhon', style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white ),),
                        Text('Email: john@mail.com', style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white ),),
                      ],
                    ),
                  )

                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(7)
                      ),
                      title: Text('Home'),
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded)),
                    ),

                    SizedBox(height: 15,),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(7)

                      ),
                      title: Text('Shopping cart'),
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded)),
                    ),
                    SizedBox(height: 15,),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(7)

                      ),
                      title: Text('Favorite Products'),
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded)),
                    ),

                    Spacer(),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(7)

                      ),
                      title: Text('Log Out'),
                      trailing: IconButton(
                        onPressed: (){
                          ref.read( authNotifierProvider.notifier ).logout();
                        },
                        icon: Icon(Icons.arrow_forward_ios_rounded)),
                    ),
                    SizedBox(height: 30,),

                  ],
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}
