// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learn_flutter_fullstack/src/constants/assest.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/chart.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/cloudmate.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/custom_drawer.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/custom_tabbar.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/report.dart';
import 'package:learn_flutter_fullstack/src/viewmodels/tabmenu_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tabsMenu = TabMenuViewMoodel().items;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabsMenu.length,
      child: Scaffold(
        appBar: _buildAppBar(),
        drawer: CustomDrawer(),
        body: TabBarView(
          children: _tabsMenu.map((item) => item.widget).toList(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Home'),
      bottom: CustomTabBar(_tabsMenu),
      actions: [
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.qr_code),
          onPressed: () {},
        )
      ],
    );
  }
}
