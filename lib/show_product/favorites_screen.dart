import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/repository/product_repository.dart';
import 'package:leboncoin/show_product/pages/product_list.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return ProductList(
      ProductRepository().getFavoritesProducts(),
      AppLocalizations.of(context)!.show_favorites,
    );
  }
}
