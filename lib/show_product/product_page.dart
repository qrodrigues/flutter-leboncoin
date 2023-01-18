import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/firebase/product_repository.dart';
import 'package:leboncoin/product/models/product.dart';
import 'package:leboncoin/show_product/widgets/product_card.dart';
import 'package:leboncoin/show_product/widgets/product_list.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductCard>>(
      future: ProductRepository().getAllProducts(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.adverts),
          ),
          backgroundColor: Colors.greenAccent.withOpacity(0.8),
          body: CustomScrollView(
            primary: false,
            slivers: <Widget>[ProductList(snapshot.data! as List<ProductCard>)],
          ),
        );
      },
    );
  }
}
