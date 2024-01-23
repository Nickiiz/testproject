// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class Them {
  const Them();

  static const Color gradientStart = const Color(0xFFffd89b);
  static const Color gradientEnd = const Color(0xFF3494E6);

  static const gradient = const LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.2, 1.0],
  );
}
