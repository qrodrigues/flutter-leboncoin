import 'package:flutter/material.dart';
import 'package:leboncoin/show_product/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList(this.products, {super.key});

  final List<ProductCard> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.unmodifiable(() sync* {
          yield* products;
        }()),
      ),
    );
  }
}
