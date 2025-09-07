

import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_platzi/features/store/presentation/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetails extends ConsumerWidget {
  final int productId;
  const ProductDetails({super.key, required this.productId });

  @override
  Widget build(BuildContext context, ref) {

    final asyncProductById = ref.watch( getProductByIdProvider( productId ) );

    return Scaffold(
      appBar: AppBar(
        title: Text('Products Details', style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body: FadeInDown(
        duration: const Duration(milliseconds: 800),
        from: 30,
        child: asyncProductById.when(
            data: (product) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SizedBox( width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              product.title,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              )
                          ),
                          Spacer(),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.1, child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)))
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: product.images.length,
                          itemBuilder: (context, index) {
                            final image = product.images[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(7),
                                child: FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder: AssetImage('assets/images/not-found.jpg'),
                                  image: NetworkImage( image )
                                ),
                              ),
                            );
                          },
                        )
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text('Price', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          Spacer(),
                          FilledButton(
                              onPressed: (){
                                ref.read( cartProvider.notifier ).addToCart( product );
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                      content: Text('Item Added!!')
                                    )
                                );
                              },
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadiusGeometry.circular(7)
                                      )
                                  )
                              ),
                              child: Text('Add to cart')
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(product.price.toString()),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Text(product.description),
                    )
                  ],
                ),
              );
            },
            error: (error, stackTrace) => Center(child: Text('Error: $error'),),
            loading: () => Center(child: CircularProgressIndicator(),),
        )
      ),
    );
  }
}
