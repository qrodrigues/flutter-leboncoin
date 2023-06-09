import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/add_product/widgets/publish_button.dart';
import 'package:leboncoin/add_product/widgets/text_input.dart';
import 'package:leboncoin/home/widgets/customAppBar.dart';
import 'package:leboncoin/themes/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/add_product_bloc.dart';


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
    return BlocProvider<AddProductBloc>(
      create: (context) => AddProductBloc(),
      child: BlocConsumer<AddProductBloc, AddProductState>(
        listener: (context, state) {
          if (state is AddProductSuccess) {
            _showToast(context, 'Le produit a été publié avec succès.');
            clearData();
          } else if (state is AddProductError) {
            _showToast(context, 'Une erreur est survenue.');
            clearData();
          }
        },
        builder: (context, state) {
          final AddProductBloc _addProductBloc = BlocProvider.of<AddProductBloc>(context);

          return Scaffold(
            appBar: CustomAppBar(title: AppLocalizations.of(context)!.create_advert),
            backgroundColor: kPrimaryColor,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextInput(
                      AppLocalizations.of(context)!.advert_title,
                      1,
                      titleController,
                      isNumber: false,
                    ),
                    TextInput(
                      AppLocalizations.of(context)!.price,
                      1,
                      priceController,
                      isNumber: true,
                    ),
                    TextInput(
                      AppLocalizations.of(context)!.description,
                      10,
                      descriptionController,
                      isNumber: false,
                    ),
                    PublishButton(() {
                      _addProductBloc.add(
                        SubmitProductEvent(
                          titleController.text,
                          double.tryParse(priceController.text) ?? 0.0,
                          descriptionController.text,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void clearData() {
    titleController.clear();
    priceController.clear();
    descriptionController.clear();
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
