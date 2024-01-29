import 'package:flutter/material.dart';
import 'package:learn_flutter_fullstack/src/pages/home/mangement/widgets/management_page.dart';
import 'package:learn_flutter_fullstack/src/pages/inbox/inbox_page.dart';

import 'package:learn_flutter_fullstack/src/pages/pages.dart';
import 'package:learn_flutter_fullstack/src/pages/profile/profile_page.dart';
import 'package:learn_flutter_fullstack/src/pages/setting/setting_page.dart';

class Route {
  static const home = '/home';
  static const login = '/login';
  static const activity = '/activity';
  static const profile = '/profile';
  static const inbox = '/inbox';
  static const setting = '/setting';
  static const management = '/management';

  static Map<String, WidgetBuilder> getall() => _route;

  static final Map<String, WidgetBuilder> _route = {
    home: (context) => HomePage(),
    login: (context) => LoginPage(),
    activity: (context) => ActivityPage(),
    profile: (context) => ProfilePage(),
    inbox: (context) => InboxPage(),
    setting: (context) => SettingPage(),
    management: (context) => ManagementPage(),
  };
}
