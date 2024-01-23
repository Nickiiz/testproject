// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learn_flutter_fullstack/src/pages/home/home_page.dart';
import 'package:learn_flutter_fullstack/src/pages/login/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyStock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
