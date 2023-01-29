import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/repository/product_repository.dart';
import 'package:leboncoin/show_product/widgets/product_list.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return ProductList(
      ProductRepository().getAllProducts(),
      AppLocalizations.of(context)!.adverts,
    );
  }
}
