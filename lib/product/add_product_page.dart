import 'package:flutter/material.dart';
import 'package:leboncoin/product/widgets/publish_button.dart';
import 'package:leboncoin/product/widgets/text_input.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Créer une annonce'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextInput("Titre de l'annonce", titleController),
                TextInput("Prix", priceController),
                TextInput("Description", descriptionController),
                PublishButton(() {
                  print(titleController.text);
                  print(priceController.text);
                  print(descriptionController.text);
                })
              ],
            ),
          ),
        ));
  }
}
