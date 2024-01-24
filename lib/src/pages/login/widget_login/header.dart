// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter_fullstack/src/utils/gradient_text.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 80, bottom: 25, left: 20, right: 20),
          child: Image.asset('assets/images/image1.png', fit: BoxFit.contain),
        ),
        GradientText(
          'บริการวิเคราะห์ข้อมูลบริษัทครบวงจร',
          style: GoogleFonts.kanit(fontSize: 20, fontWeight: FontWeight.bold),
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 12, 68, 115), Color(0xFFffd89b)]),
        ),
      ],
    );
  }
}
