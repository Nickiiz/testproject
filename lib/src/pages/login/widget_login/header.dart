// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80, bottom: 25, left: 20, right: 20),
      child: Image.asset('assets/images/image1.png', fit: BoxFit.contain),
    );
  }
}
