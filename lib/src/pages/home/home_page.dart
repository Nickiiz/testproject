import 'package:flutter/material.dart';
import 'package:learn_flutter_fullstack/src/constants/assest.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Assets.BASE_IMAGE),
          // Image.asset(Assets.BASE_IMAGE),
        ],
      ),
    );
  }
}
