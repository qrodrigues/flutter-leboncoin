import 'package:flutter/material.dart';
import 'package:leboncoin/product/models/product.dart';
import 'package:leboncoin/show_product/widgets/favorite_icon.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
    this.product, {
    super.key,
  });

  final Product product;

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
              child: Text(product.title),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                product.price.toString(),
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: FavoriteIcon(),
            ),
          ],
        ),
      ),
    );
  }
}
