
import 'package:flutter/material.dart';

final clothes = [
  'https://i.imgur.com/ZKGofuB.jpeg',
  'https://i.imgur.com/wXuQ7bm.jpeg',
  'https://i.imgur.com/R3iobJA.jpeg',
  'https://i.imgur.com/9LFjwpI.jpeg',
];

class ItemCard extends StatelessWidget {
  final List<String> imagesUrl;
  final int idImage;
  const ItemCard({ super.key, required this.idImage, required this.imagesUrl  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ClipRRect(
          borderRadius: BorderRadiusGeometry.directional(topStart: Radius.circular(7), topEnd: Radius.circular(7)),
          child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/images/not-found.jpg'),
              image: NetworkImage( imagesUrl[idImage] )
          ),
        ),

        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.directional(bottomStart: Radius.circular(7), bottomEnd: Radius.circular(7)),
            child: Container(
              width: double.infinity,
              color: Colors.black12,
              child: Column(
                children: [
                  Text('Name'),
                  Text('Price 2000')
                ],
              ),
            ),
          ),
        )

      ],
    );
  }
}




