import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leboncoin/add_product/add_product_page.dart';
import 'package:leboncoin/home/cubit/home_state.dart';
import 'package:leboncoin/show_product/favorites_screen.dart';
import 'package:leboncoin/show_product/product_screen.dart';
import 'package:leboncoin/themes/color.dart';

import 'cubit/home_cubit.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  // int _selectedIndex = 0;
  // static const List<Widget> _widgetOptions = <Widget>[
  //   ProductScreen(),
  //   FavoritesScreen(),
  //   AddProductPage()
  // ];
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.state);

    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [ProductScreen(), FavoritesScreen(), AddProductPage()],
      ),
      // Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.red,
        ),
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarButton(
                groupValue: selectedTab,
                value: HomeStates.search,
                icon: Icons.search,
              ),
              _NavigationBarButton(
                groupValue: selectedTab,
                value: HomeStates.favorite,
                icon: Icons.star,
              ),
              _NavigationBarButton(
                groupValue: selectedTab,
                value: HomeStates.create,
                icon: Icons.add,
              ),
            ],
          ),
          // items: <BottomNavigationBarItem>[
          //   BottomNavigationBarItem(
          //     icon: const Icon(Icons.search),
          //     label: AppLocalizations.of(context)!.search,
          //   ),
          //   BottomNavigationBarItem(
          //     icon: const Icon(Icons.star),
          //     label: AppLocalizations.of(context)!.favorites,
          //   ),
          //   BottomNavigationBarItem(
          //     icon: const Icon(Icons.add),
          //     label: AppLocalizations.of(context)!.create,
          //   )
          // ],
          // currentIndex: _selectedIndex,
          // unselectedItemColor: kSecondaryColor,
          // selectedItemColor: kPrimaryLightColor,
          // onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class _NavigationBarButton extends StatelessWidget {
  const _NavigationBarButton({
    required this.groupValue,
    required this.value,
    required this.icon,
  });

  final HomeStates groupValue;
  final HomeStates value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        spacing: -10,
        children: [
          IconButton(
            onPressed: () => context.read<HomeCubit>().setState(value),
            icon: Icon(
              icon,
              color: groupValue != value ? kPrimaryLightColor : kSecondaryColor,
              size: 32,
            ),
          ),
          Text(AppLocalizations.of(context)!.appBarText(value.toString()))
        ],
      ),
    );
  }
}
