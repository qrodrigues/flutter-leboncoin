import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leboncoin/product/models/product.dart';
import 'package:leboncoin/show_product/widgets/product_card.dart';

class ProductRepository {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(String title, double price, String description) async {
    await productsCollection.add({
      'title': title,
      'price': price,
      'description': description,'date': DateTime.now(),
      'favorite': false,
      'image1': 'https://firebasestorage.googleapis.com/v0/b/market-place-app-e8464.appspot.com/o/custom-no-image.png?alt=media&token=d1fad652-eb6f-490f-9efe-4a4177178e7d'
    });
  }

  Future<List<ProductCard>> getAllProducts() async {
    final productsData = await productsCollection.get();

    final products = createProductCarListFromProductList(
      productsData,
    );
    sortProductListByDate(products);

    return products.reversed.toList();
  }

  Future<List<ProductCard>> getFavoritesProducts() async {
    final productsData =
        await productsCollection.where('favorite', isEqualTo: true).get();

    final products = createProductCarListFromProductList(
      productsData,
    );
    sortProductListByDate(products);

    return products.reversed.toList();
  }

  List<ProductCard> createProductCarListFromProductList(
    QuerySnapshot<Object?> productsData,
  ) {
    final jsonProductsData =
        productsData.docs.map((doc) => doc.data()).toList();

    final products = <ProductCard>[];
    for (var i = 0; i < jsonProductsData.length; i++) {
      final dynamic productJson = jsonProductsData[i];
      productJson!['id'] = productsData.docs[i].id;
      products.add(ProductCard(Product.fromJson(jsonProductsData[i])));
    }
    return products;
  }

  void sortProductListByDate(List<ProductCard> products) {
    products.sort((a, b) => a.product.date.compareTo(b.product.date));
  }
}
