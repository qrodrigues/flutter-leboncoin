import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final CollectionReference productsCollection =
    FirebaseFirestore.instance.collection('products');

    Future<List<ProductCard>> getProducts() async {
      final productsData = await productsCollection.get();

      final jsonProductsData =
      productsData.docs.map((doc) => doc.data()).toList();

      final products = <ProductCard>[];
      for (var i = 0; i < jsonProductsData.length; i++) {
        products.add(ProductCard(Product.fromJson(jsonProductsData[i])));
      }
      products.sort((a, b) => a.product.date.compareTo(b.product.date));

      return products.reversed.toList();
    }

    return FutureBuilder<List<ProductCard>>(
      future: getProducts(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.hasData && !snapshot.data!.isNotEmpty) {
          return const Text('Document does not exist');
        }

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

        return const Text('loading');
      },
    );
  }
}
