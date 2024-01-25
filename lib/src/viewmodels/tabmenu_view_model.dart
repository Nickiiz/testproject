// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/chart.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/cloudmate.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/report.dart';

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
          Chart(),
          icon: FontAwesomeIcons.chartArea,
        ),
        TabMenu(
          'Report',
          Report(),
          icon: FontAwesomeIcons.fileAlt,
        ),
      ];
}
