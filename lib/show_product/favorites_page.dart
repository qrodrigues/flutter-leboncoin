import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/show_product/widgets/product.dart';
import 'package:leboncoin/show_product/widgets/product_list.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final List<Product> products = [
    const Product('Trottinette électrique Xiaomi', 200),
    const Product('Table en bois', 140),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.favorites),
      ),
      backgroundColor: Colors.greenAccent.withOpacity(0.8),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[ProductList(products)],
      ),
    );
  }
}
