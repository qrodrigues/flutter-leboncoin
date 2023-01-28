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
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.image1),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: SizedBox(
              height: 150,
              child: Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: FavoriteIcon(this),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(product.title, style: TextStyle(fontSize: 16)),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(product.price.toInt().toString() + '€',
                      style: TextStyle(fontSize: 16, color: Color(0xff71B48D))),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
