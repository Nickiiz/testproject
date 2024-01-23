// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:learn_flutter_fullstack/src/config/theme.dart' as custom_them;
import 'package:learn_flutter_fullstack/src/pages/login/widget_login/header.dart';
import 'package:learn_flutter_fullstack/src/pages/login/widget_login/login_from.dart';
import 'package:learn_flutter_fullstack/src/pages/login/widget_login/single_sing_on.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, //กระจาย colum ให้เต็มหน้า
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: custom_them.Them.gradient,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Header(),
                SizedBox(
                  height: 30,
                ),
                LoginFrom(),
                SizedBox(
                  height: 30,
                ),
                Text('forgot password'),
                SizedBox(
                  height: 30,
                ),
                SingleSingOn(),
                SizedBox(
                  height: 30,
                ),
                Text('Register'),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // TextButton _buildTextButton(
  //   String text, {
  //   VoidCallback onPressed,
  //   double fontSize = 16,
  // }) {}
}
