import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/home/widgets/customAppBar.dart';
import 'package:leboncoin/repository/product_repository.dart';
import 'package:leboncoin/show_product/bloc/show_product_bloc.dart';
import 'package:leboncoin/themes/color.dart';

class ProductList extends StatelessWidget {
  ProductList(
    this.titlePage, {
    super.key,
    required this.favorites,
  });

  final String titlePage;
  final ProductRepository _productRepository = ProductRepository();
  final bool favorites;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowProductBloc>(
      create: (context) => ShowProductBloc(_productRepository)
        ..add(GetProductsEvent(favorites: favorites)),
      child: BlocConsumer<ShowProductBloc, ShowProductState>(
        listener: (context, state) {
          if (state is ShowProductSuccess) {
          } else if (state is ShowProductError) {}
        },
        builder: (context, state) {
          if (state is ShowProductSuccess) {
            if (state.products.isEmpty) {
              return Scaffold(
                appBar: CustomAppBar(title: titlePage),
                backgroundColor: kPrimaryColor,
                body: Center(
                  child: Text(AppLocalizations.of(context)!.no_data),
                ),
              );
            }

            return Scaffold(
              appBar: CustomAppBar(title: titlePage),
              backgroundColor: kPrimaryColor,
              body: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverGrid.count(
                      childAspectRatio: 100 / 130,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: List.unmodifiable(() sync* {
                        yield* state.products;
                      }()),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ShowProductError) {
            return Scaffold(
              appBar: CustomAppBar(title: titlePage),
              backgroundColor: kPrimaryColor,
              body: Center(
                child: Text(AppLocalizations.of(context)!.product_error),
              ),
            );
          }

          return Scaffold(
            appBar: CustomAppBar(title: titlePage),
            backgroundColor: kPrimaryColor,
            body: Center(
              child: Text(AppLocalizations.of(context)!.product_loading),
            ),
          );
        },
      ),
    );
  }
}
