
import 'package:animate_do/animate_do.dart';
import 'package:ECommprarse/features/store/domain/entities/product.dart';
import 'package:ECommprarse/features/store/presentation/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomListTile extends ConsumerWidget {
  final List<Product> cartItems;
  const CustomListTile({
    super.key, required this.cartItems,
  });

  @override
  Widget build(BuildContext context, ref) {

    final textStyle = Theme.of(context).textTheme.titleLarge;

    if( cartItems.isEmpty ) {
      return Center(child: Text('No items yet', style: textStyle,),);
    }

    return FadeInRight(
      duration: Duration(milliseconds: 500),
      from: 30,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: cartItems.length,
        itemBuilder: (context, index) {

          final product = cartItems[index];

          return GestureDetector(
            onTap: () => context.push('/products-details/${product.id}'),

            child: Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: ListTile(
                tileColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(7),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(7),
                  child: FadeInImage(
                      fit: BoxFit.contain,
                      height: 100,
                      placeholder: AssetImage('assets/images/not-found.jpg'),
                      image: NetworkImage( product.images.first, )
                  ),
                ),


                title: Text(product.title, overflow: TextOverflow.ellipsis,),
                subtitle: Text(product.price.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: (){
                          ref.read( cartProvider.notifier ).increaseItem(product.id);
                        },
                        icon: Icon(Icons.add)),
                    Text( product.quantity.toString() ),
                    IconButton(
                        onPressed: (){
                          ref.read( cartProvider.notifier ).decreaseItem(product.id);
                        },
                        icon: Icon(Icons.remove)),
                    IconButton(
                        onPressed: (){
                          ref.read( cartProvider.notifier ).removeToCart(product.id);
                        },
                        icon: Icon(Icons.delete_forever, color: Colors.redAccent,)),
                  ],
                ),
              ),
            ),


          );
        },
      )
    );
  }
}