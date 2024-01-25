// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learn_flutter_fullstack/src/constants/setting.dart';
import 'package:learn_flutter_fullstack/src/pages/home/home_page.dart';
import 'package:learn_flutter_fullstack/src/pages/login/login_page.dart';
import 'package:learn_flutter_fullstack/src/config/route.dart' as custom_route;
import 'package:learn_flutter_fullstack/src/viewmodels/splash_screen_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: custom_route.Route.getall(),
      title: 'MyStock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        // initialData: InitialData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final token = snapshot.data?.getString('Setting.TOKEN_PREF') ?? '';

            if (token.isEmpty) {
              return SplashScreenUI();
            }
            return LoginPage();
          }
          return SizedBox();
        },
      ),
    );
  }
}
