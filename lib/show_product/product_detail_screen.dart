import 'package:flutter/material.dart';
import 'package:leboncoin/product/models/product.dart';
import 'package:leboncoin/show_product/pages/display_product_page.dart';


class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen(this.product, {super.key});
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DisplayProductPage(widget.product);
  }
}