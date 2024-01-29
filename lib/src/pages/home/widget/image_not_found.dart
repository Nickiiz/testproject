// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ImmageNotFound extends StatelessWidget {
  const ImmageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          Icons.image_not_supported,
          size: 30,
          color: Colors.black,
        ),
        Text(
          'Image Not Found',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
