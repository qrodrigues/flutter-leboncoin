import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/add_product/add_product_page.dart';
import 'package:leboncoin/show_product/favorites_screen.dart';
import 'package:leboncoin/show_product/product_screen.dart';
import 'package:leboncoin/themes/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ProductScreen(),
    FavoritesScreen(),
    AddProductPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.red,
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: AppLocalizations.of(context)!.search,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              label: AppLocalizations.of(context)!.favorites,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.add),
              label: AppLocalizations.of(context)!.create,
            )
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: kSecondaryColor,
          selectedItemColor: kPrimaryLightColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
