import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/show_product/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList(this.products, {super.key});

  final Future<List<ProductCard>> products;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductCard>>(
      future: products,
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
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: List.unmodifiable(() sync* {
                      yield* snapshot.data! as List<ProductCard>;
                    }()),
                  ),
                ),
              ],
            ),
          );
        }

        return Text(AppLocalizations.of(context)!.product_loading);
      },
    );
  }
}
