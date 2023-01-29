import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/product/models/product.dart';
import 'package:leboncoin/repository/product_repository.dart';
import 'package:leboncoin/show_product/pages/display_product_page.dart';
import 'package:leboncoin/show_product/widgets/product_list.dart';


class DetailProductPage extends StatefulWidget {
  const DetailProductPage(this.product, {super.key});
  final Product product;

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  Widget build(BuildContext context) {
    return DisplayProductPage(widget.product);
  }
}