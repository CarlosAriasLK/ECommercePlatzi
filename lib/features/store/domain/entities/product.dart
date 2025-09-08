
import 'dart:convert';

class Product {

  final int id;
  final String title;
  final double price;
  final String description;
  final String slug;
  final List<String> images;
  final int quantity;

  Product({required this.id, required this.title, required this.price, required this.description, required this.slug, required this.images, this.quantity = 1});

  factory Product.fromJson( Map<String, dynamic > json ) => Product(
    id: (json['id'] as num).toInt(),
    title: json['title'],
    price: (json['price'] as num).toDouble(),
    description: json['description'],
    slug: json['slug'],
    images: json['slug'] != null ? List<String>.from( json['images']) : ['https://cdn-icons-png.freepik.com/512/2748/2748558.png']
  );

  factory Product.fromMap( Map<String, dynamic > map ) => Product(
    id: map['id'],
    title: map['title'],
    price: map['price'],
    description: map['description'],
    slug: map['slug'],
    images: map['slug'] != null ? List<String>.from( map['images']) : ['https://cdn-icons-png.freepik.com/512/2748/2748558.png']
  );

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "slug": slug,
      "images": jsonEncode(images),
      "quantity": quantity
    };
  }

  copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? slug,
    List<String>? images,
    int? quantity,
  }) => Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      slug: slug ?? this.slug,
      images: images ?? this.images
  );

}