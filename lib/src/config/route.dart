import 'package:flutter/material.dart';
import 'package:learn_flutter_fullstack/src/pages/inbox/inbox_page.dart';

import 'package:learn_flutter_fullstack/src/pages/pages.dart';
import 'package:learn_flutter_fullstack/src/pages/profile/profile_page.dart';
import 'package:learn_flutter_fullstack/src/pages/setting/setting_page.dart';

class Route {
  static const home = '/home';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const profile = '/profile';
  static const inbox = '/inbox';
  static const setting = '/setting';

  static Map<String, WidgetBuilder> getall() => _route;

  static final Map<String, WidgetBuilder> _route = {
    home: (context) => HomePage(),
    login: (context) => LoginPage(),
    dashboard: (context) => DashBoardPage(),
    profile: (context) => ProfilePage(),
    inbox: (context) => InboxPage(),
    setting: (context) => SettingPage(),
  };
}
