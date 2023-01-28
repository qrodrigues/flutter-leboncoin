import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/show_product/widgets/product_card.dart';

import 'customAppBar.dart';

class ProductList extends StatelessWidget {
  const ProductList(this.products, this.titlePage, {super.key});

  final Future<List<ProductCard>> products;
  final String titlePage;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductCard>>(
      future: products,
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data?.length == 0) {
            return Scaffold(
              appBar: customAppBar(title: titlePage),
              backgroundColor: Colors.greenAccent.withOpacity(0.8),
              body: Center(
                child: Text(AppLocalizations.of(context)!.no_data),
              ),
            );
          }
          return Scaffold(
            appBar: customAppBar(title: titlePage),
            backgroundColor: Colors.greenAccent.withOpacity(0.8),
            body: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    childAspectRatio: 100 / 130,
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
        return Scaffold(
          appBar: customAppBar(title: titlePage),
          backgroundColor: Colors.greenAccent.withOpacity(0.8),
          body: Center(
            child: Text(AppLocalizations.of(context)!.product_loading),
          ),
        );
      },
    );
  }
}
