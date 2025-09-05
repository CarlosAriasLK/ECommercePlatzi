
import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_platzi/presentation/widgets/shared/item_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            title: Text('ECommprarse'),
            floating: true,
            actions: [
              IconButton(
                  onPressed: (){}, icon: Icon(Icons.search),
              ),
              IconButton(
                  onPressed: (){}, icon: Icon(Icons.shopping_cart),
              ),
            ],
          ),

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
  const _CollectionSlide({super.key});

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
