import 'package:flutter/material.dart';
import 'package:leboncoin/repository/product_repository.dart';
import 'package:leboncoin/show_product/widgets/product_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return ProductList(
      ProductRepository().getFavoritesProducts(),
      AppLocalizations.of(context)!.favorites,
    );
  }
}
