
import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_platzi/features/store/presentation/widgets/shared/item_card.dart';
import 'package:flutter/material.dart';
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
                itemCount: productsTemporary.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ItemCard(idImage: index, imagesUrl: productsTemporary),
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
                        child: Text('Clothes', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),
                      ),
                      _CustomListViewStore(),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text('Shoes', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),
                      ),
                      _CustomListViewStore(),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text('Electronics', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),
                      ),
                      _CustomListViewStore(),

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


final productsTemporary = [
  'https://i.imgur.com/QkIa5tT.jpeg',
  'https://i.imgur.com/1twoaDy.jpeg',
  'https://i.imgur.com/cHddUCu.jpeg'
];

class _CollectionSlide extends StatelessWidget {
  const _CollectionSlide();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.4,
      child: Swiper(
        scale: 0.8,
        itemCount: productsTemporary.length,
        autoplay: true,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
          child: FadeInImage(
              placeholder: AssetImage('assets/images/not-found.jpg'),
              image: NetworkImage(productsTemporary[index]),
          ),
        ),
      ),
    );
  }
}

final clothes = [
  'https://i.imgur.com/ZKGofuB.jpeg',
  'https://i.imgur.com/wXuQ7bm.jpeg',
  'https://i.imgur.com/R3iobJA.jpeg',
  'https://i.imgur.com/9LFjwpI.jpeg'
];

class _CustomListViewStore extends StatelessWidget {
  const _CustomListViewStore();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => context.push('/products-details/1'),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: clothes.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              width: 150,
              child: ItemCard( idImage: index, imagesUrl: clothes, ),
            ),
          ),
        ),
      ),
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
