import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:leboncoin/home/widgets/customAppBar.dart';
import 'package:leboncoin/product/models/product.dart';
import 'package:leboncoin/themes/color.dart';
import 'package:leboncoin/themes/textstyle.dart';

class DisplayProductPage extends StatelessWidget {
  const DisplayProductPage(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.title),
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                AppLocalizations.of(context)!.detail_title_image,
                style: product_detail_section,
              ),
            ),
            Image.network(product.image1),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                AppLocalizations.of(context)!.detail_title_description,
                style: product_detail_section,
              ),
            ),
            Text(
              product.description,
              style: product_detail_description,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                AppLocalizations.of(context)!.detail_title_informations,
                style: product_detail_section,
              ),
            ),
            Text(
              'Date de publication : ${DateFormat("dd/MM/yyyy à hh:mm").format(product.date.toDate())}',
              style: product_detail_description,
            ),
            Text(
              'Prix : ${product.price.toInt()}€',
              style: product_detail_description,
            ),
          ],
        ),
      ),
    );
  }
}
