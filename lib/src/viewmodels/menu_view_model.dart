import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter_fullstack/src/config/route.dart' as custom_route;

class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function(BuildContext context) onTap;

  const Menu(
    this.title, {
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });
}

class MenuViewModel {
  List<Menu> get items => <Menu>[
        Menu(
          'Profile',
          icon: FontAwesomeIcons.user,
          iconColor: Colors.blue,
          onTap: (context) {
            Navigator.pushNamed(context, custom_route.Route.profile);
          },
        ),
        Menu(
          'DashBoard',
          icon: FontAwesomeIcons.chartPie,
          iconColor: Colors.blue,
          onTap: (context) {
            Navigator.pushNamed(context, custom_route.Route.dashboard);
          },
        ),
        Menu(
          'Inbox',
          icon: FontAwesomeIcons.inbox,
          iconColor: Colors.blue,
          onTap: (context) {
            Navigator.pushNamed(context, custom_route.Route.inbox);
          },
        ),
        Menu(
          'Setting',
          icon: FontAwesomeIcons.cogs,
          iconColor: Colors.blue,
          onTap: (context) {
            Navigator.pushNamed(context, custom_route.Route.setting);
          },
        ),
      ];
}
