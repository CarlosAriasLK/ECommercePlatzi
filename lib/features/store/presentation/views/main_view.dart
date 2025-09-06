
import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_platzi/features/store/presentation/providers/product_provider.dart';
import 'package:ecommerce_platzi/features/store/presentation/widgets/shared/item_card.dart';
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
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),

        ],
      ),

      endDrawer: Drawer(
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
                onPressed: (){},
                child: Text('Clear')
              ),
            ),
            
            
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 2,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // child: ItemCard(idImage: index, imagesUrl: productsTemporary),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(7)
                      )
                    )
                  ),
                  onPressed: (){},
                  child: Text('Check out')
                ),
              ),

            )


          ],
        ),
      ),

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
                        child: Text('Shoes', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),
                      ),
                      _CustomListViewStore(slug: '4',),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text('Forniture', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),
                      ),
                      _CustomListViewStore(slug: '3',),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text('Electronics', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),
                      ),
                      _CustomListViewStore(slug: '2',),

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
    final asyncProducts = ref.watch( productsProvider );

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
              return Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/not-found.jpg'),
                  image: NetworkImage(product.images.first),
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
    return FutureBuilder(
      future: ref.read(productsProvider.notifier).loadProductByCategory(slug),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        final products = snapshot.data ?? [];

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
                  child: ItemCard(imageUrl: product.images.first, name: product.title, price: product.price,),
                ),
              );
            },
          ),
        );
      },
    );
  }
}



class Person {
  final String name;
  final String reference;
  final int price;

  Person(this.name, this.reference, this.price);
}

final people = [
  Person('Jeans', 'break', 120),
  Person('Jeans', 'break', 120),
  Person('Jeans', 'break', 120),
];

class _IconSearch extends StatelessWidget {
  const _IconSearch();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showSearch(
        context: context,
        delegate: SearchPage<Person>(
          items: people,
          searchLabel: 'Search Product',
          suggestion: Center(
            child: Text('Filter product by name, reference or price'),
          ),
          failure: Center(
            child: Text('No product found'),
          ),
          filter: (person) => [
            person.name,
            person.reference,
            person.price.toString(),
          ],
          builder: (person) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: GestureDetector(
              onTap: () => context.push('/products-details/1'),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(7)
                ),
                title: Text(person.name),
                subtitle: Text(person.reference),
                trailing: Text('${person.price} '),
              ),
            ),
          ),
        ),
      ), icon: Icon(Icons.search),
    );
  }
}
