// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter_fullstack/src/constants/setting.dart';
import 'package:learn_flutter_fullstack/src/viewmodels/menu_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:learn_flutter_fullstack/src/config/route.dart' as custom_route;

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildProfile(),
          ..._buildMainMenu(),
          Spacer(),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.signOutAlt,
              color: Colors.grey,
            ),
            title: Text('LogOut'),
            onTap: showDialogLogout,
          ),
        ],
      ),
    );
  }

  void showDialogLogout() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            content: Text('Are You sure you want to logout'),
            actions: <Widget>[
              TextButton(
                child: Text('Cancle'),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
              ),
              TextButton(
                child: Text(
                  'Loguot',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.remove(Setting.TOKEN_PREF);

                    Navigator.of(dialogContext).pop();
                    Navigator.pushNamedAndRemoveUntil(
                        context, custom_route.Route.login, (route) => false);
                    //prefs.clear();
                  });
                },
              ),
            ],
          );
        });
  }

  UserAccountsDrawerHeader _buildProfile() => UserAccountsDrawerHeader(
        accountName: Text('Panuwat'),
        accountEmail: Text('nick.555@gmail.com'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage('assets/images/image3.jpeg'),
        ),
      );

  List<ListTile> _buildMainMenu() => MenuViewModel()
      .items
      .map(
        (item) => ListTile(
          title: Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          leading: badges.Badge(
            showBadge: item.icon == FontAwesomeIcons.inbox,
            badgeContent: Text(
              '99',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
            badgeStyle: badges.BadgeStyle(badgeColor: Colors.red),
            child: FaIcon(
              item.icon,
              color: item.iconColor,
            ),
          ),
          onTap: () {
            item.onTap(context);
          },
        ),
      )
      .toList();
}
