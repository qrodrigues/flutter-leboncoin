import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

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
}
