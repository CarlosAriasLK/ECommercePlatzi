
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class ItemCard extends ConsumerWidget {
  final int productId;
  final String imageUrl;
  final String name;
  final double price;
  const ItemCard({ super.key, required this.imageUrl, required this.name, required this.price, required this.productId });

  @override
  Widget build(BuildContext context, ref) {

    return GestureDetector(
      onTap: () => context.push('/products-details/$productId'),
      child: AspectRatio(
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
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
      ),
    );
  }
}
