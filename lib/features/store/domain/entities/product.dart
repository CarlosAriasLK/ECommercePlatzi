
class Product {

  final int id;
  final String title;
  final double price;
  final String description;
  final String slug;
  final List<String> images;

  Product({required this.id, required this.title, required this.price, required this.description, required this.slug, required this.images});


  factory Product.fromJson( Map<String, dynamic > json ) => Product(
      id: (json['id'] as num).toInt(),
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      slug: json['slug'],
      images: json['slug'] != null ? List<String>.from( json['images']) : ['https://cdn-icons-png.freepik.com/512/2748/2748558.png']
  );

}