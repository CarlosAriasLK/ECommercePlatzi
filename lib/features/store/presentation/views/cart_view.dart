

import 'package:ecommerce_platzi/features/store/presentation/widgets/shared/custom_list_tile.dart';
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
                childCount: clothesCartView.length,
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: CustomListTile(index: index),
                ),
              )
          )  

        ],
      ),
    );
  }
}

