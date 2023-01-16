import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/show_product/widgets/product.dart';
import 'package:leboncoin/show_product/widgets/product_list.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Product> products = [
    const Product('Trottinette électrique Xiaomi', 200),
    const Product('Volkswagen Polo', 10000),
    const Product('Table en bois', 140),
    const Product('Lots de boulons', 20)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.adverts),
      ),
      backgroundColor: Colors.greenAccent.withOpacity(0.8),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[ProductList(products)],
      ),
    );
  }
}
