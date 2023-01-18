import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leboncoin/product/models/product.dart';
import 'package:leboncoin/show_product/widgets/product_card.dart';

class ProductRepository {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  Future<List<ProductCard>> getAllProducts() async {
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

  Future<List<ProductCard>> getFavoritesProducts() async {
    // TODO() : récupérer les produits favoris
    return [];
  }
}
