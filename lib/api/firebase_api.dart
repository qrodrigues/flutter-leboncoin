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
      'image1': 'https://firebasestorage.googleapis.com/v0/b/market-place-app-e8464.appspot.com/o/no-image.jpg?alt=media&token=22cd0bf1-8336-4fa4-9668-ccb2f4cc73c6'
    });
  }

  void updateProductFavoriteField(Product product) {
    productsCollection.doc(product.id).update(
      {'favorite': !product.favorite},
    );
  }
}
