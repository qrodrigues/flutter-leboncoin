import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product(this.title, this.price, {super.key});

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Align(alignment: Alignment.topLeft, child: Text(title)),
      Align(
        alignment: Alignment.topRight,
        child: Text(price.toString()),
      )
    ]);
  }
}
