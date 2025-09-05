

import 'package:ecommerce_platzi/presentation/widgets/shared/item_card.dart';
import 'package:flutter/material.dart';


final clothesCartView = [
  'https://i.imgur.com/ZKGofuB.jpeg',
  'https://i.imgur.com/wXuQ7bm.jpeg',
  'https://i.imgur.com/R3iobJA.jpeg',
  'https://i.imgur.com/9LFjwpI.jpeg',
];

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart view'),
      ),

      body: CustomScrollView(
        slivers: [

          SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: clothes.length,
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    tileColor: Colors.black12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(7),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(7),
                      child: FadeInImage(
                        fit: BoxFit.contain,
                        placeholder: AssetImage('assets/images/not-found.jpg'),
                        image: NetworkImage( clothes[index], )
                      ),
                    ),
                    title: Text('Name'),
                    subtitle: Text('Price'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                        Text('10'),
                        IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever, color: Colors.redAccent,)),
                      ],
                    ),
                  ),
                ),
              )
          )  
        


        ],
      ),
    );
  }
}
