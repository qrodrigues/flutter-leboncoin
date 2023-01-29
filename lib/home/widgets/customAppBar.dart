import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, right: 50, left: 50),
      child: Align(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xfffee9e1),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Color.fromRGBO(0, 0, 0, 0.25),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              child: Text(title, style: const TextStyle(fontSize: 16)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
