import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget with PreferredSizeWidget {
  const customAppBar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xfffee9e1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(title, style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
