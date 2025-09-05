
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),

      body: Column(
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
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded)),
                  ),
                  SizedBox(height: 15,),

                ],
              ),
            ),
          )



        ],
      ),
    );
  }
}
