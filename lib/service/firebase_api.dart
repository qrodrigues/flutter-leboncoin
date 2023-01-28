import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:leboncoin/product/models/product.dart';

class FirebaseAPI {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  void addProduct(
    TextEditingController titleController,
    TextEditingController priceController,
    TextEditingController descriptionController,
  ) {
    productsCollection.add({
      'title': titleController.text,
      'price': priceController.text,
      'description': descriptionController.text,
      'date': DateTime.now(),
      'favorite': false,
      'image1': 'https://firebasestorage.googleapis.com/v0/b/market-place-app-e8464.appspot.com/o/custom-no-image.png?alt=media&token=5cd04ba6-f43d-444a-9943-6059e2df7a88'
    });
  }

  void updateProductFavoriteField(Product product) {
    productsCollection.doc(product.id).update(
      {'favorite': !product.favorite},
    );
  }
}
