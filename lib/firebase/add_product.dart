import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:leboncoin/product/models/product.dart';

class FirebaseProduct {
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
      'date': DateTime.now()
    });
  }

  void updateProductFavoriteField(Product product) {
    if (product.favorite) {
      productsCollection.doc(product.id).update(
        {'favorite': false},
      );
    } else {
      productsCollection.doc(product.id).update(
        {'favorite': true},
      );
    }
  }
}
