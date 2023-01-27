import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leboncoin/product/models/product.dart';
import 'package:leboncoin/show_product/widgets/product_card.dart';

class ProductRepository {
  final CollectionReference productsCollection =
  FirebaseFirestore.instance.collection('products');

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
      QuerySnapshot<Object?> productsData,) {
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
