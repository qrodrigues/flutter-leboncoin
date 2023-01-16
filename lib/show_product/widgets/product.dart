import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product(this.title, this.price, {super.key});

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
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
        ]),
      ),
    );
  }
}
