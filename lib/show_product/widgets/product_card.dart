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
            Container(
              margin: EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.image1),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(
                height: 95,
                child: Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FavoriteIcon(this),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(product.title, style: TextStyle(fontSize: 16)),
            ),
            Expanded(
                child: Container()
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                product.price.toInt().toString() + '€',
                  style: TextStyle(fontSize: 16, color: Colors.green)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
