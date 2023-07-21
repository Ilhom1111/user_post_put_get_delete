import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  final String title;
  const Appbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      title: Text(title),
      centerTitle: true,
    );
  }
}
