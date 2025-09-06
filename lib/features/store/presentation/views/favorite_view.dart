
import 'package:ecommerce_platzi/features/store/presentation/widgets/shared/item_card.dart';
import 'package:flutter/material.dart';

final clothesFavorites = [
  'https://i.imgur.com/ZKGofuB.jpeg',
  'https://i.imgur.com/wXuQ7bm.jpeg',
  'https://i.imgur.com/R3iobJA.jpeg',
  'https://i.imgur.com/9LFjwpI.jpeg'
];

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),

      body: CustomScrollView(
        slivers: [

          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7
            ),

            delegate: SliverChildBuilderDelegate(
              childCount: clothesFavorites.length,
                (context, index) {
                return SizedBox(
                  width: 200,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ItemCard(idImage: index, imagesUrl: clothesFavorites,),
                  ),
                );
              },
            ),

          )


        ],
      ),
    );
  }
}
