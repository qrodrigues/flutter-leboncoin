import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget with PreferredSizeWidget {
  const customAppBar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 70),
        child: Center(
          child: Text(
            this.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
