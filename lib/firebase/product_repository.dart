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
      final dynamic productJson = jsonProductsData[i];
      productJson!['id'] = productsData.docs[i].id;
      products.add(ProductCard(Product.fromJson(jsonProductsData[i])));
    }
    products.sort((a, b) => a.product.date.compareTo(b.product.date));

    return products.reversed.toList();
  }

  Future<List<ProductCard>> getFavoritesProducts() async {
    final productsData =
        await productsCollection.where('favorite', isEqualTo: true).get();

    final jsonProductsData =
        productsData.docs.map((doc) => doc.data()).toList();

    final products = <ProductCard>[];
    for (var i = 0; i < jsonProductsData.length; i++) {
      final dynamic productJson = jsonProductsData[i];
      productJson!['id'] = productsData.docs[i].id;
      products.add(ProductCard(Product.fromJson(jsonProductsData[i])));
    }
    products.sort((a, b) => a.product.date.compareTo(b.product.date));

    return products.reversed.toList();
  }

  Future<DocumentSnapshot> getProductById(String id) async {
    final productsData =
        await productsCollection.where('id', isEqualTo: id).get();

    final jsonProductsData = productsData.docs[0];

    return jsonProductsData;
  }
}
