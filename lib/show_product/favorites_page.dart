import 'package:flutter/material.dart';
import 'package:leboncoin/firebase/product_repository.dart';
import 'package:leboncoin/show_product/widgets/product_list_scaffold.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return ProductListScaffold(ProductRepository().getFavoritesProducts());
  }
}
