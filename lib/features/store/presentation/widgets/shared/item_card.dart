
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';


class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  const ItemCard({ super.key, required this.imageUrl, required this.name, required this.price });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.7,
      child: FadeInRight(
        duration: Duration(milliseconds: 500),
        from: 30,
        child: Column(
          children: [

            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/images/not-found.jpg'),
                  image: NetworkImage( imageUrl ),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(7)),
              ),
              child: Column(
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
                  Text( price.toString() ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
