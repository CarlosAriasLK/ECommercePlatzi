
import 'package:card_swiper/card_swiper.dart';
import 'package:ECommprarse/features/store/domain/entities/product.dart';
import 'package:ECommprarse/features/store/presentation/providers/product_provider.dart';
import 'package:ECommprarse/features/store/presentation/widgets/shared/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:search_page/search_page.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ECommprarse', style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          _IconSearch(),

          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),

        ],
      ),

      endDrawer: EndDrawer(),

      body: CustomScrollView(
        slivers: [

          SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                  (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _CategoriesSlide(),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text('Latest Collection', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),
                      ),

                      _CollectionSlide(),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text('Clothes', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),
                      ),
                      _CustomListViewStore(slug: '1',),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text('Electronics', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),
                      ),
                      _CustomListViewStore(slug: '2',),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text('Forniture', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),
                      ),
                      _CustomListViewStore(slug: '3',),

                      SizedBox(height: 50,)

                    ],
                  ),
              )
          )

        ],
      ),
    );
  }
}

final categories = [
  'Shoes',
  'clothes',
  'Electronics',
  'Forniture',
  'Miscellaneous'
];

class _CategoriesSlide extends StatelessWidget {
  const _CategoriesSlide();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Swiper(
        autoplay: true,
        itemWidth: 20,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(color: Colors.blue),
          child: Center(child: Text( categories[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), ),),
        ),
      ),
    );
  }
}


class _CollectionSlide extends ConsumerWidget {
  const _CollectionSlide();

  @override
  Widget build(BuildContext context, ref) {

    final size = MediaQuery.of(context).size;
    final asyncProducts = ref.watch( getAllProductsProvider );

    return SizedBox(
      height: size.height * 0.4,
      child: asyncProducts.when(
        data: (products) {
          return Swiper(
            scale: 0.8,
            itemCount: products.length,
            autoplay: true,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () => context.push('/products-details/${product.id}'),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/not-found.jpg'),
                    image: NetworkImage(product.images.first),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) => Center(child: Text('Erorr: $error'),),
        loading: () => Center(child: CircularProgressIndicator(),),
      )
    );
  }
}

class _CustomListViewStore extends ConsumerWidget {
  final String slug;
  const _CustomListViewStore({required this.slug});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProductByCategory = ref.watch( loadProductByCategoryProvider(slug) );

    return asyncProductByCategory.when(
        data: (products) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    width: 150,
                    child: ItemCard(imageUrl: product.images.first, name: product.title, price: product.price, productId: product.id,),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text('Error :$error'),),
        loading: () => Center(child: CircularProgressIndicator(),),
    );
  }
}


class _IconSearch extends ConsumerWidget {
  const _IconSearch();

  @override
  Widget build(BuildContext context, ref) {

    final asyncProducst = ref.watch( getAllProductsProvider );

    return asyncProducst.when(
        data: (products) {
          return IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: SearchPage<Product>(
                items: products,
                searchLabel: 'Search Product',
                suggestion: Center(
                  child: Text('Filter product by name or price'),
                ),
                failure: Center(
                  child: Text('No product found'),
                ),
                filter: (product) => [
                  product.title,
                  product.price.toString(),
                ],
                builder: (product) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: GestureDetector(
                    onTap: () => context.push('/products-details/${product.id}'),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(7)
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(7),
                        child: FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: AssetImage('assets/images/not-found.jpg'),
                          image: NetworkImage( product.images.first)
                        ),
                      ),
                      title: Text(product.title),
                      trailing: Text(product.price.toString()),
                    ),
                  ),
                ),
              ),
            ), icon: Icon(Icons.search),
          );
        },
        error: (error, stackTrace) => Center(child: Text('Error $error'),),
        loading: () => Center(child: CircularProgressIndicator(),),
    );
  }
}



class EndDrawer extends ConsumerWidget {
  const EndDrawer({ super.key,  });

  @override
  Widget build(BuildContext context, ref) {

    final cartItems = ref.watch( cartProvider );
    final textStyle = Theme.of(context).textTheme.titleLarge;

    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text('Cart', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold ),),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FilledButton(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(7)
                        )
                    )
                ),
                onPressed: (){
                  ref.read( cartProvider.notifier ).clearItems();
                },
                child: Text('Clear')
            ),
          ),

          cartItems.isEmpty
            ? Center(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text('No items yet', style: textStyle,),
            ))
            : SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                    child: ItemCard(productId: product.id, name: product.title, imageUrl: product.images.first, price: product.price,),
                  );
                }
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: cartItems.isNotEmpty
                  ? FilledButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(7)
                            )
                        )
                    ),
                    onPressed: (){
                      context.pop();
                      context.go('/home/1');
                    },
                    child: Text('Check out')
                )
                : null,
              ),

            )

        ],
      ),
    );
  }
}
