import 'package:flutter/material.dart';
import 'package:leboncoin/firebase/product_repository.dart';
import 'package:leboncoin/show_product/widgets/product_list_scaffold.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return ProductListScaffold(ProductRepository().getAllProducts());
  }
}
