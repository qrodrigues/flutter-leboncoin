import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product({
    required this.title,
    required this.price,
    required this.description,
    required this.date,
  });

  factory Product.fromJson(dynamic json) {
    return Product(
      title: json['title'] as String,
      price: double.parse(json['price'].toString()),
      description: json['description'] as String,
      date: json['date'] as Timestamp,
    );
  }

  final String title;
  final double price;
  final String description;
  final Timestamp date;
}
