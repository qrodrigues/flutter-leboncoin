import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.title,
    required this.price,
    required this.description,
    super.key,
  });

  factory ProductCard.fromJson(dynamic json) {
    return ProductCard(
      title: json['titre'] as String,
      price: double.parse(json['prix'].toString()),
      description: json['description'] as String,
    );
  }

  final String title;
  final double price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(title),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                price.toString(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
