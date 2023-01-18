import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/firebase/product_repository.dart';
import 'package:leboncoin/show_product/widgets/product_card.dart';
import 'package:leboncoin/show_product/widgets/product_list.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductCard>>(
      future: ProductRepository().getAllProducts(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.adverts),
            ),
            backgroundColor: Colors.greenAccent.withOpacity(0.8),
            body: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                ProductList(snapshot.data! as List<ProductCard>)
              ],
            ),
          );
        }

        return Text(AppLocalizations.of(context)!.product_loading);
      },
    );
  }
}
