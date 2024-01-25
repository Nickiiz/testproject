import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn_flutter_fullstack/src/app.dart';
import 'package:learn_flutter_fullstack/src/pages/home/home_page.dart';

import 'package:learn_flutter_fullstack/src/pages/login/login_page.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  Timer? _timer;
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      },
    );

    super.initState();
  }

  @override
  // void dispose() {
  //   _timer!.cancel();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image5.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
