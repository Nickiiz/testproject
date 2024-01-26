// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/calendar.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/cloudmate.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/leave.dart';

class TabMenu {
  final String title;
  final IconData icon;
  final Widget widget;

  const TabMenu(
    this.title,
    this.widget, {
    required this.icon,
  });
}

class TabMenuViewMoodel {
  List<TabMenu> get items => <TabMenu>[
        TabMenu(
          'Cloud Mate',
          CloudMate(),
          icon: FontAwesomeIcons.box,
        ),
        TabMenu(
          'Calendar',
          Calendar(),
          icon: FontAwesomeIcons.calendarCheck,
        ),
        TabMenu(
          'Leave',
          Leave(),
          icon: FontAwesomeIcons.fileAlt,
        ),
      ];
}
