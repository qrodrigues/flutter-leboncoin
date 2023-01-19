import 'package:flutter/material.dart';
import 'package:leboncoin/firebase/product_repository.dart';
import 'package:leboncoin/show_product/widgets/product_list.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return ProductList(ProductRepository().getFavoritesProducts());
  }
}
