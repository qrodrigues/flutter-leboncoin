import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/add_product/widgets/publish_button.dart';
import 'package:leboncoin/add_product/widgets/text_input.dart';
import 'package:leboncoin/api/firebase_api.dart';
import 'package:leboncoin/show_product/widgets/customAppBar.dart';

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
      appBar: customAppBar(title: AppLocalizations.of(context)!.create_advert),
      backgroundColor: Colors.greenAccent.withOpacity(0.8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextInput(
                AppLocalizations.of(context)!.advert_title,
                1,
                titleController,
                false
              ),
              TextInput(
                AppLocalizations.of(context)!.price,
                1,
                priceController,
                true
              ),
              TextInput(
                AppLocalizations.of(context)!.description,
                10,
                descriptionController,
                false
              ),
              PublishButton(() {
                FirebaseAPI().addProduct(
                  titleController,
                  priceController,
                  descriptionController,
                );
                titleController.clear();
                priceController.clear();
                descriptionController.clear();
              })
            ],
          ),
        ),
      ),
    );
  }
}
