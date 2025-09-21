
import 'package:ECommprarse/features/store/presentation/providers/favorite_products_provider.dart';
import 'package:ECommprarse/features/store/presentation/widgets/shared/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FavoriteView extends ConsumerWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final favoriteProducts = ref.watch( favoriteProductsProvider );
    final textTheme = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Products', style: TextStyle( fontWeight: FontWeight.bold ),),
      ),

      body: favoriteProducts.when(
          data: (products) {
            if( products.isEmpty ) {
              return Center(child: Text('No items Yet', style: textTheme,),);
            }

            return CustomScrollView(
              slivers: [

                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7
                  ),

                  delegate: SliverChildBuilderDelegate(
                    childCount: products.length,
                      (context, index) {
                      final product = products[index];
                      return SizedBox(
                        width: 200,
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ItemCard(imageUrl: product.images.first, name: product.title, price: product.price, productId: product.id,),
                        ),
                      );
                    },
                  ),

                )

              ],
            );
          },
          error: (error, stackTrace) => Center(child: Text('Error: $error'),),
          loading: () => Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}
